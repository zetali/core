@api @provisioning_api-app-required @skipOnLDAP
Feature: get groups
  As an admin
  I want to be able to get groups
  So that I can see all the groups in my ownCloud

  Background:
    Given using OCS API version "1"

  @smokeTest @skipOnLdap @issue-ldap-500 @notToImplementOnOCIS
  Scenario: admin gets all the groups
    Given group "0" has been created
    And group "brand-new-group" has been created
    And group "España" has been created
    When the administrator gets all the groups using the provisioning API
    Then the groups returned by the API should be
      | España          |
      | admin           |
      | brand-new-group |
      | 0               |

  @skipOnLdap @issue-ldap-499 @notToImplementOnOCIS
  Scenario: admin gets all the groups, including groups with mixed case
    Given group "case-sensitive-group" has been created
    And group "Case-Sensitive-Group" has been created
    And group "CASE-SENSITIVE-GROUP" has been created
    When the administrator gets all the groups using the provisioning API
    Then the groups returned by the API should be
      | admin                |
      | case-sensitive-group |
      | Case-Sensitive-Group |
      | CASE-SENSITIVE-GROUP |

  @smokeTest @skipOnOcV10
  Scenario: admin gets all the groups
    Given group "0" has been created
    And group "brand-new-group" has been created
    And group "España" has been created
    When the administrator gets all the groups using the provisioning API
    Then the groups returned by the API should be
      | España          |
      | brand-new-group   |
      | 0                 |
      | philosophy-haters |
      | physics-lovers    |
      | polonium-lovers   |
      | quantum-lovers    |
      | radium-lovers     |
      | violin-haters     |
      | users             |
      | sysusers          |
      | sailing-lovers    |

  @smokeTest @skipOnOcV10 @toImplementOnOCIS
  Scenario: admin gets all the groups, including groups with mixed case
    Given group "case-sensitive-group" has been created
    And group "Case-Sensitive-Group" has been created
    And group "CASE-SENSITIVE-GROUP" has been created
    When the administrator gets all the groups using the provisioning API
    Then the groups returned by the API should be
      | case-sensitive-group |
      | Case-Sensitive-Group |
      | CASE-SENSITIVE-GROUP |
      | philosophy-haters |
      | physics-lovers    |
      | polonium-lovers   |
      | quantum-lovers    |
      | radium-lovers     |
      | violin-haters     |
      | users             |
      | sysusers          |
      | sailing-lovers    |