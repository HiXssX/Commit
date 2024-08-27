/****** Object:  Procedure [HumanResources].[uspUpdateEmployeeLogin]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE PROCEDURE [HumanResources].[uspUpdateEmployeeLogin]
    @BusinessEntityID [int], 
    @OrganizationNode [hierarchyid],
    @LoginID [nvarchar](256),
    @JobTitle [nvarchar](50),
    @HireDate [datetime],
    @CurrentFlag [dbo].[Flag]
WITH EXECUTE AS CALLER
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        UPDATE [HumanResources].[Employee] 
        SET [OrganizationNode] = @OrganizationNode 
            ,[LoginID] = @LoginID 
            ,[JobTitle] = @JobTitle 
            ,[HireDate] = @HireDate 
            ,[CurrentFlag] = @CurrentFlag 
        WHERE [BusinessEntityID] = @BusinessEntityID;
    END TRY
    BEGIN CATCH
        EXECUTE [dbo].[uspLogError];
    END CATCH;
END;

EXECUTE sys.sp_addextendedproperty @name = N'MS_Description', @value = N'Updates the Employee table with the values specified in the input parameters for the given BusinessEntityID.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'PROCEDURE', @level1name = N'uspUpdateEmployeeLogin'
EXECUTE sys.sp_addextendedproperty @name = N'MS_Description', @value = N'Input parameter for the stored procedure uspUpdateEmployeeLogin. Enter a valid EmployeeID from the Employee table.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'PROCEDURE', @level1name = N'uspUpdateEmployeeLogin', @level2type = N'PARAMETER', @level2name = N'@BusinessEntityID'
EXECUTE sys.sp_addextendedproperty @name = N'MS_Description', @value = N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter the current flag for the employee.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'PROCEDURE', @level1name = N'uspUpdateEmployeeLogin', @level2type = N'PARAMETER', @level2name = N'@CurrentFlag'
EXECUTE sys.sp_addextendedproperty @name = N'MS_Description', @value = N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a hire date for the employee.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'PROCEDURE', @level1name = N'uspUpdateEmployeeLogin', @level2type = N'PARAMETER', @level2name = N'@HireDate'
EXECUTE sys.sp_addextendedproperty @name = N'MS_Description', @value = N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a title for the employee.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'PROCEDURE', @level1name = N'uspUpdateEmployeeLogin', @level2type = N'PARAMETER', @level2name = N'@JobTitle'
EXECUTE sys.sp_addextendedproperty @name = N'MS_Description', @value = N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a valid login for the employee.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'PROCEDURE', @level1name = N'uspUpdateEmployeeLogin', @level2type = N'PARAMETER', @level2name = N'@LoginID'
EXECUTE sys.sp_addextendedproperty @name = N'MS_Description', @value = N'Input parameter for the stored procedure uspUpdateEmployeeHireInfo. Enter a valid ManagerID for the employee.', @level0type = N'SCHEMA', @level0name = N'HumanResources', @level1type = N'PROCEDURE', @level1name = N'uspUpdateEmployeeLogin', @level2type = N'PARAMETER', @level2name = N'@OrganizationNode'
