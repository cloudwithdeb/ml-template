#!/bin/bash

# Define Variables
LOCATION="global"
GITHUB_REPO="ml-template"
PROJECT_ID="trans-engine-394004"
WORKLOAD_IDENTITY_POOLS="k8s-pools"
WORKLOAD_IDENTITY_PROVIDER="k8s-provider"
SERVICE_ACCOUNT_NAME="k8s-service-account"
WORKLOAD_IDENTITY_POOLS_PROJECT_ID="446963927366"

# gcloud iam workload-identity-pools create "$WORKLOAD_IDENTITY_POOLS" \
# --project="$PROJECT_ID" \
# --location="$LOCATION" \
# --display-name="k8s Pool"

# gcloud iam workload-identity-pools providers create-oidc $WORKLOAD_IDENTITY_PROVIDER \
# --project="$PROJECT_ID" \
# --location="$LOCATION" \
# --workload-identity-pool="$WORKLOAD_IDENTITY_POOLS" \
# --display-name="k8s provider" \
# --attribute-mapping="google.subject=assertion.sub,attribute.actor=assertion.actor,attribute.aud=assertion.aud" \
# --issuer-uri="https://token.actions.githubusercontent.com"

# gcloud iam service-accounts create $SERVICE_ACCOUNT_NAME \
# --description "k8s service account" \
# --display-name "k8s service account"

# gcloud projects add-iam-policy-binding $PROJECT_ID \
# --member="serviceAccount:$SERVICE_ACCOUNT_NAME@$PROJECT_ID.iam.gserviceaccount.com" \
# --role="roles/compute.admin"


# gcloud projects add-iam-policy-binding $PROJECT_ID \
# --member="serviceAccount:$SERVICE_ACCOUNT_NAME@$PROJECT_ID.iam.gserviceaccount.com" \
# --role="roles/iam.serviceAccountTokenCreator"

# gcloud projects add-iam-policy-binding $PROJECT_ID \
# --member="serviceAccount:$SERVICE_ACCOUNT_NAME@$PROJECT_ID.iam.gserviceaccount.com" \
# --role="roles/iam.serviceAccountUser"

gcloud iam service-accounts add-iam-policy-binding "$SERVICE_ACCOUNT_NAME@$PROJECT_ID.iam.gserviceaccount.com" \
--project="$PROJECT_ID" \
--role="roles/iam.workloadIdentityUser" \
--member="principalSet://iam.googleapis.com/projects/$WORKLOAD_IDENTITY_POOLS_PROJECT_ID/locations/$LOCATION/workloadIdentityPools/$WORKLOAD_IDENTITY_POOLS/attribute.repository/$GITHUB_REPO"