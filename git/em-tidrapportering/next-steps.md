# Next Steps - Timesheet Application Development

**Last Updated:** 2025-10-25T14:22:00+02:00

## ✅ Architecture Decision: Amplify Lambda Functions (Not Express Server)

**Key Insight:** For AWS Amplify deployment, we should use the existing Lambda function architecture instead of Express server + database.

### Correct Architecture
- ✅ **Frontend**: Static files on Amplify hosting
- ✅ **API**: Existing Lambda function (`redmineProxy`) via API Gateway
- ✅ **Data**: Direct Redmine API integration (no separate database)
- ✅ **Auth**: Azure AD token validation in Lambda functions

### What We Don't Need
- ❌ Express.js backend server
- ❌ SQLite database for timesheet storage
- ❌ Separate backend infrastructure

---

## Current Status
✅ **Frontend Complete**: Weekly timesheet UI with Azure AD authentication  
✅ **Authentication Setup**: Azure AD integration (Client ID: 9f7934bc-2feb-47fc-8a2f-2ca1253e8462)  
✅ **Lambda Function**: Existing `redmineProxy` function handles Redmine API calls  
✅ **API Service**: Updated to use Amplify endpoints instead of Express backend

## Immediate Priority: Phase 1 - Lambda Function Enhancement

### Task #1205: Enhance Existing Lambda Function
**Status**: Ready to start  
**Estimated Time**: 1 day  

#### Technical Requirements
1. **Add Azure AD Token Validation**
   - Install `jsonwebtoken` in Lambda function
   - Validate Bearer tokens from frontend
   - Extract user info from Azure AD claims

2. **Enhance Time Entry Submission**
   - Update existing `/time-entries` endpoint
   - Map frontend timesheet data to Redmine format
   - Submit directly to Redmine API

3. **Environment Variables**
   ```
   REDMINE_BASE_URL=your_redmine_url
   REDMINE_API_KEY=your_api_key
   AZURE_TENANT_ID=fab10934-dd6d-47ed-83ea-f9f9936257e0
   AZURE_CLIENT_ID=9f7934bc-2feb-47fc-8a2f-2ca1253e8462
   ```

#### Current Lambda Structure
```
amplify/backend/function/redmineProxy/
├── src/
│   ├── index.js (✅ Existing - handles Redmine API proxy)
│   └── package.json
```

#### Acceptance Criteria
- [ ] Lambda validates Azure AD tokens
- [ ] Time entries submit directly to Redmine
- [ ] Projects and issues fetch from Redmine
- [ ] No separate database needed

---

## Phase 2: Frontend Integration (HIGH)

### Task #1206: Update Frontend for Lambda Integration
**Dependencies**: Phase 1 complete  
**Estimated Time**: 0.5 days  

#### Technical Requirements
1. **API Service Update** ✅ Complete
   - Updated to use `/api` endpoints (Amplify API Gateway)
   - Removed Express backend references
   - Added direct Redmine time entry submission

2. **Timesheet Submission**
   - Convert weekly timesheet data to individual Redmine time entries
   - Submit each day's hours as separate entries
   - Handle success/error responses

#### Acceptance Criteria
- [ ] Frontend calls Lambda functions via API Gateway
- [ ] Time entries submit to Redmine successfully
- [ ] Projects load from Redmine API
- [ ] No local database dependencies

---

## Phase 3: AWS Amplify Deployment (HIGH)

### Task #1207: Deploy to AWS Amplify
**Dependencies**: Phases 1-2 complete  
**Estimated Time**: 1 day  

#### Deployment Strategy
1. **Frontend Deployment**
   - Deploy static files to Amplify hosting
   - Configure build settings for HTML/CSS/JS

2. **Lambda Function Deployment**
   - Deploy enhanced `redmineProxy` function
   - Configure API Gateway endpoints
   - Set environment variables in Amplify

3. **Environment Configuration**
   - Configure Redmine API credentials
   - Set Azure AD configuration
   - Test authentication flow

#### Amplify Configuration
```
amplify.yml - Build specification (✅ Exists)
Environment variables in Amplify console
```

---

## Current File Structure
```
redmine-time-app/
├── index.html (✅ Complete)
├── js/
│   ├── auth.js (✅ Complete)
│   ├── api-service.js (✅ Updated for Lambda)
│   ├── timesheet.js (✅ Complete)
│   └── redmine-api.js (✅ Complete)
├── config/
│   └── auth-config.js (✅ Complete)
├── amplify/
│   └── backend/function/redmineProxy/ (✅ Exists)
└── amplify.yml (✅ Complete)
```

## Key Configuration Details
- **Azure AD Tenant ID**: `fab10934-dd6d-47ed-83ea-f9f9936257e0`
- **Azure AD Client ID**: `9f7934bc-2feb-47fc-8a2f-2ca1253e8462`
- **API Endpoint**: `/api` (Amplify API Gateway)
- **Data Storage**: Redmine API (no separate database)

## Data Flow
1. User logs in with Azure AD → Gets access token
2. User fills timesheet → Frontend calls `/api/time-entries`
3. Lambda validates token → Submits to Redmine API
4. Redmine stores time entries → Returns success/error

## Success Criteria
- [ ] Users authenticate with Azure AD
- [ ] Time entries submit directly to Redmine
- [ ] No separate backend infrastructure needed
- [ ] Application deployed on Amplify
- [ ] All functionality works in production

## Next Action
**Start with Task #1205: Enhance Lambda Function**
1. Add Azure AD token validation to existing Lambda
2. Update time entry submission logic
3. Test with frontend integration

---

*Architecture simplified: Frontend → API Gateway → Lambda → Redmine API*
