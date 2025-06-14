from selenium import webdriver
from selenium.webdriver.edge.service import Service
from selenium.webdriver.edge.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from transformers import LongformerTokenizer, LongformerForSequenceClassification, Trainer, TrainingArguments
from datasets import load_dataset
import torch
import time
import re
from bs4 import BeautifulSoup
import torch


# Sentiment analysis setup
tokenizer = LongformerTokenizer.from_pretrained("allenai/longformer-base-4096")
model = LongformerForSequenceClassification.from_pretrained("allenai/longformer-base-4096")


def analyze_sentiment(text):
    # Tokenize input text
    inputs = tokenizer(text, return_tensors="pt", truncation=True, padding=True, max_length=4096)
    
    # Analyze sentiment using the model
    with torch.no_grad():
        logits = model(**inputs).logits
    
    # Determine sentiment
    predicted_class = torch.argmax(logits, dim=-1).item()
    
    if predicted_class == 0:
        return 'NEGATIVE'
    elif predicted_class == 1:
        return 'POSITIVE'
    else:
        return 'NEUTRAL'
    
def print_results(results):
    print("-----------------------------------------------")

    print(f" - 해시태그 게시물 분석:")
    
    sentiment_counts = {'POSITIVE': 0, 'NEGATIVE': 0, 'NEUTRAL': 0}
    seen_posts = set()

    for idx, result in enumerate(results, 1):
        content, date, tags = result

        post_key = (content, date, tuple(tags))
        if post_key in seen_posts:
            continue
        seen_posts.add(post_key)

        sentiment = analyze_sentiment(content)

        print(f"게시물 {idx}:")
        print(f"  내용: {content}")
        print(f"  날짜: {date}")
        print(f"  해시태그: {tags}")
        print(f"  내용 여론 분석: {sentiment}\n")

        sentiment_counts[sentiment] += 1

    total_posts = len(seen_posts)
    if total_posts > 0:
        positive_ratio = sentiment_counts['POSITIVE'] / total_posts * 100
        negative_ratio = sentiment_counts['NEGATIVE'] / total_posts * 100
        neutral_ratio = sentiment_counts['NEUTRAL'] / total_posts * 100
        print(f"기능1: 전체 게시물에 대한 여론 분석 결과:")
        print(f"긍정적 비율: {positive_ratio:.2f}%")
        print(f"부정적 비율: {negative_ratio:.2f}%")
        print(f"중립적 비율: {neutral_ratio:.2f}%")
    else:
        print("수집된 게시물이 없습니다.")

# Edge driver path setup
edge_driver_path = edge_driver_path = r"C:\Users\qudgh\git_ohgnuyb\openSourceSW\insta_sentiment_analyzer\msedgedriver.exe"
edge_options = Options()
edge_options.add_experimental_option("detach", True)
edge_options.add_experimental_option("excludeSwitches", ["enable-logging"])

service = Service(executable_path=edge_driver_path)
driver = webdriver.Edge(service=service, options=edge_options)

def insta_login(driver, username, password):
    driver.get('https://instagram.com')
    WebDriverWait(driver, 20).until(EC.presence_of_element_located((By.NAME, 'username')))

    login_id = driver.find_element(By.NAME, 'username')
    login_id.send_keys(username)
    login_pwd = driver.find_element(By.NAME, 'password')
    login_pwd.send_keys(password)
    login_pwd.submit()

    try:
        WebDriverWait(driver, 20).until(EC.presence_of_element_located((By.CSS_SELECTOR, 'button[type="button"]')))
        print("로그인 성공!")
    except Exception as e:
        print(f"로그인 오류: {e}")

def go_to_home(driver):
    try:
        WebDriverWait(driver, 20).until(EC.presence_of_element_located((By.CSS_SELECTOR, 'svg[aria-label="홈"]')))
        print("로그인 상태 확인 완료.")
    except Exception as e:
        print(f"홈 페이지로 이동 중 오류 발생: {e}")

def insta_searching(word):
    url = 'https://www.instagram.com/explore/tags/' + word
    driver.get(url)
    WebDriverWait(driver, 20).until(EC.presence_of_element_located((By.CSS_SELECTOR, 'div._aagu')))
    return url

def select_first(driver):
    first = driver.find_element(By.CSS_SELECTOR, 'div._aagu')
    first.click()
    time.sleep(5)

def get_content(driver):
    html = driver.page_source
    soup = BeautifulSoup(html, 'html.parser')
    try: 
       content_with_hashtags = soup.select('div._a9zs')[0].text
       content = re.sub(r'#\S+', '', content_with_hashtags)
    except: 
        content = ' '
    
    tags = re.findall(r'#[^\s#,\\]+', content_with_hashtags)
    if not tags:
        tags = [f"#{keyword}"]
    date = soup.select('time.x1p4m5qa')[0]['datetime'][:10]
    return [content, date, tags]

def move_next(driver):
    try:
        WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CSS_SELECTOR, 'div._aaqg._aaqh button._abl-')))
        right = driver.find_element(By.CSS_SELECTOR, 'div._aaqg._aaqh button._abl-')
        right.click()
        WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CSS_SELECTOR, 'div._a9zs')))
    except Exception as e:
        time.sleep(5)

def crawl_instagram(username, password, keyword, num_posts=10):
    try:
        insta_login(driver, username, password)
        go_to_home(driver)

        url = insta_searching(keyword)
        driver.get(url)
        WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CSS_SELECTOR, 'div._aagu')))
        select_first(driver)

        results = []
        analyzed_count = 0

        while analyzed_count < num_posts:
            try:
                data = get_content(driver)
                results.append(data)
                move_next(driver)
                analyzed_count += 1
            except Exception as e:
                print(f"오류 발생: {e}")
                time.sleep(5)
                move_next(driver)

        return results

    except Exception as e:
        print(f"크롤링 중 오류 발생: {e}")
        return []

# Main execution
if __name__ == "__main__":
    username = "bxungho.o"
    password = "Shbtbook21291!"
    keyword = "NEGATIVEANDPOSITIVE"
    num_posts = 10

    try:
        results = crawl_instagram(username, password, keyword, num_posts)
        print("-----------------------------------------------")
        print(f"수집된 게시물 {len(results)}개")
        print_results(results)
    finally:
        driver.quit()