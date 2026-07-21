# FinSentinel 🛡️

A lightweight, high-performance Ruby microservice engineered to solve a critical issue in the modern Fintech landscape: **Localized Digital Fraud**.

Traditional fraud engines often miss colloquial or geographically specific phishing/scam language embedded in transaction notes or payment requests. FinSentinel implements natural language processing models for detecting localized digital fraud before the transaction settles, specifically targeting under-resourced language trends.

## 🚀 Features
* **NLP-Driven Analysis**: Scans unstructured transaction descriptions for localized fraud vectors.
* **Microservice Architecture**: Built on Sinatra & Puma for blazing-fast response times.
* **Plug-and-Play**: Easily fits into event-driven architectures as an intermediary validation step.

## 🛠️ Quick Start

```bash
bundle install
rackup -p 8080
```

## 📡 Example API Call

```bash
curl -X POST http://localhost:8080/api/v1/transactions/analyze \
-H "Content-Type: application/json" \
-d '{"id": "txn_89231", "amount": 500, "description": "Urgent transfer for tax penalty"}'
```
