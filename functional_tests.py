from selenium import webdriver

browser = webdriver.Firefox()
browser.get('http://localhost:80')

assert 'Django' in browser.title
