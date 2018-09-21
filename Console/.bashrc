PROMPT_COMMAND="
	ConEmuC -StoreCWD;
	echo -en '\033[37;1;41m ------------ \033[0m\n';
	ls"
#c;

alias c='clear'
alias ll='ls -l'
alias x='exit'
alias ls='ls -S -1 --color -a'
alias t='touch'

PATH=$PATH:'/c/Program Files/Sublime Text 3' $*
PATH=$PATH:'/c/Program Files/Notepad++' $*
PATH=$PATH:'/e/PHP/PhpStorm 2017.1.4/bin' $*
PATH=$PATH:'/e/JavaScript/WebStorm 2017.1/bin' $*
PATH=$PATH:'/c/Program Files/Opera' $*

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1='\[\e[1;32m\]\D{%d.%m.%y} \t \[\e[36m\]\w\[\e[33m\]`git_branch`\n\$ \[\e[31m\]'
PS2='~ '

trap 'printf "\e[0m" "$_"' DEBUG

alias server='browser-sync start --server --files "*.html, *.css, *.php, *.js, */*.html, */*.css, */*.php, */*.js"'

alias gs='git status'
alias ga='git add'
alias gb='git branch -v'
alias gc='git commit'
alias gd='git diff'
alias go='git checkout'
alias gk='gitk --all&'
alias gr='git remote'
alias gp='git push'
alias gf='git fetch'
alias gl='git log'
alias gal='git all'
alias g_recommit='git commit --amend'
alias g_untr='git rm --cached'
alias g_res='git reset HEAD'
alias g_find='git grep'
alias g_rev='git revert'
alias g_space='git diff --check'
alias g_move='git reset'

add_branch() {
	gr add $1 $2
}

.bashrc() {
	subl ~/.bashrc
}

.gitconf() {
	subl ~/.gitconfig
}

opera() {
	opera.exe $* &
}

storm() {
	phpstorm64.exe $* &
}

web_storm() {
	webstorm64.exe $* &
}

t_subl() {
	t $*
	subl $*
}

t_pstorm() {
	t $*
	phpstorm64.exe $* &
}

sd(){
  cd $1
}

.(){
  cd ..
}

localhost(){
  cd /e/OpenServer/OSPanel/domains/localhost
}

download() {
	cd /d/downloadWORK
}

books() {
	cd /e/books
}

home() {
	cd /e/Projects
}

m_dir() {
	mkdir $*
}

# ---------------------------
# - Новый проект в phpStorm -
# ---------------------------
storm_new-project:() {
	echo Storm project ${1:?} created!
	mkdir .idea
	echo '<?xml version="1.0" encoding="UTF-8"?>
	<project version="4">
	  <component name="ProjectModuleManager">
	    <modules>
	      <module fileurl="file://$PROJECT_DIR$/.idea/'$1'.iml" filepath="$PROJECT_DIR$/.idea/'$1'.iml" />
	    </modules>
	  </component>
	</project>' > .idea/modules.xml

	echo '<?xml version="1.0" encoding="UTF-8"?>
	<module type="WEB_MODULE" version="4">
	  <component name="NewModuleRootManager">
	    <content url="file://$MODULE_DIR$" />
	    <orderEntry type="inheritedJdk" />
	    <orderEntry type="sourceFolder" forTests="false" />
	  </component>
	</module>' > .idea/$1.iml

	echo '<?xml version="1.0" encoding="UTF-8"?>
<project version="4">
  <component name="ChangeListManager">
    <list default="true" id="5569a7a7-73ee-4dc0-aec9-3ca6bba507ca" name="Default" comment="" />
    <option name="EXCLUDED_CONVERTED_TO_IGNORED" value="true" />
    <option name="TRACKING_ENABLED" value="true" />
    <option name="SHOW_DIALOG" value="false" />
    <option name="HIGHLIGHT_CONFLICTS" value="true" />
    <option name="HIGHLIGHT_NON_ACTIVE_CHANGELIST" value="false" />
    <option name="LAST_RESOLUTION" value="IGNORE" />
  </component>
  <component name="ExecutionTargetManager" SELECTED_TARGET="default_target" />
  <component name="FileEditorManager">
    <leaf>
      <file leaf-file-name="index.html" pinned="false" current-in-tab="false">
        <entry file="file://$PROJECT_DIR$/index.html">
          <provider selected="true" editor-type-id="text-editor">
            <state relative-caret-position="0">
              <caret line="0" column="0" lean-forward="false" selection-start-line="0" selection-start-column="0" selection-end-line="0" selection-end-column="0" />
              <folding />
            </state>
          </provider>
        </entry>
      </file>
      <file leaf-file-name="style.css" pinned="false" current-in-tab="true">
        <entry file="file://$PROJECT_DIR$/style.css">
          <provider selected="true" editor-type-id="text-editor">
            <state relative-caret-position="0">
              <caret line="0" column="0" lean-forward="false" selection-start-line="0" selection-start-column="0" selection-end-line="0" selection-end-column="0" />
              <folding />
            </state>
          </provider>
        </entry>
      </file>
    </leaf>
  </component>
  <component name="FileTemplateManagerImpl">
    <option name="RECENT_TEMPLATES">
      <list>
        <option value="CSS File" />
      </list>
    </option>
  </component>
  <component name="IdeDocumentHistory">
    <option name="CHANGED_PATHS">
      <list>
        <option value="$PROJECT_DIR$/style.css" />
      </list>
    </option>
  </component>
  <component name="JsBuildToolGruntFileManager" detection-done="true" sorting="DEFINITION_ORDER" />
  <component name="JsBuildToolPackageJson" detection-done="true" sorting="DEFINITION_ORDER" />
  <component name="JsGulpfileManager">
    <detection-done>true</detection-done>
    <sorting>DEFINITION_ORDER</sorting>
  </component>
  <component name="PhpWorkspaceProjectConfiguration" backward_compatibility_performed="true" />
  <component name="ProjectFrameBounds">
    <option name="x" value="960" />
    <option name="width" value="960" />
    <option name="height" value="1040" />
  </component>
  <component name="ProjectView">
    <navigator currentView="ProjectPane" proportions="" version="1">
      <flattenPackages />
      <showMembers />
      <showModules />
      <showLibraryContents />
      <hideEmptyPackages />
      <abbreviatePackageNames />
      <autoscrollToSource />
      <autoscrollFromSource />
      <sortByType />
      <manualOrder />
      <foldersAlwaysOnTop value="true" />
    </navigator>
    <panes>
      <pane id="Scope" />
      <pane id="ProjectPane">
        <subPane>
          <PATH>
            <PATH_ELEMENT>
              <option name="myItemId" value="'$1'" />
              <option name="myItemType" value="com.intellij.ide.projectView.impl.nodes.ProjectViewProjectNode" />
            </PATH_ELEMENT>
            <PATH_ELEMENT>
              <option name="myItemId" value="'$1'" />
              <option name="myItemType" value="com.jetbrains.php.projectView.PhpTreeStructureProvider$1" />
            </PATH_ELEMENT>
          </PATH>
        </subPane>
      </pane>
      <pane id="Scratches" />
    </panes>
  </component>
  <component name="PropertiesComponent">
    <property name="settings.editor.selected.configurable" value="preferences.pluginManager" />
    <property name="WebServerToolWindowFactoryState" value="false" />
    <property name="list.type.of.created.stylesheet" value="CSS" />
  </component>
  <component name="RunDashboard">
    <option name="ruleStates">
      <list>
        <RuleState>
          <option name="name" value="ConfigurationTypeDashboardGroupingRule" />
        </RuleState>
        <RuleState>
          <option name="name" value="StatusDashboardGroupingRule" />
        </RuleState>
      </list>
    </option>
  </component>
  <component name="RunManager">
    <configuration default="true" type="CodeceptionConfigurationType" factoryName="Codeception">
      <PhpTestRunnerSettings />
      <method />
    </configuration>
    <configuration default="true" type="JavaScriptTestRunnerJest" factoryName="Jest">
      <node-interpreter value="project" />
      <working-dir value="" />
      <envs />
      <scope-kind value="ALL" />
      <method />
    </configuration>
    <configuration default="true" type="JavaScriptTestRunnerProtractor" factoryName="Protractor">
      <config-file value="" />
      <node-interpreter value="project" />
      <envs />
      <method />
    </configuration>
    <configuration default="true" type="JavascriptDebugType" factoryName="JavaScript Debug">
      <method />
    </configuration>
    <configuration default="true" type="NodeJSConfigurationType" factoryName="Node.js" path-to-node="project" working-dir="">
      <method />
    </configuration>
    <configuration default="true" type="PHPUnitRunConfigurationType" factoryName="PHPUnit">
      <TestRunner />
      <method />
    </configuration>
    <configuration default="true" type="PhpBehatConfigurationType" factoryName="Behat">
      <BehatRunner />
      <method />
    </configuration>
    <configuration default="true" type="PhpLocalRunConfigurationType" factoryName="PHP Console">
      <method />
    </configuration>
    <configuration default="true" type="PhpSpecConfigurationType" factoryName="PHPSpec">
      <PhpTestRunnerSettings />
      <method />
    </configuration>
    <configuration default="true" type="js.build_tools.gulp" factoryName="Gulp.js">
      <method />
    </configuration>
    <configuration default="true" type="js.build_tools.npm" factoryName="npm">
      <command value="run" />
      <scripts />
      <node-interpreter value="project" />
      <envs />
      <method />
    </configuration>
    <configuration default="true" type="mocha-javascript-test-runner" factoryName="Mocha">
      <node-interpreter>project</node-interpreter>
      <node-options />
      <working-directory />
      <pass-parent-env>true</pass-parent-env>
      <envs />
      <ui />
      <extra-mocha-options />
      <test-kind>DIRECTORY</test-kind>
      <test-directory />
      <recursive>false</recursive>
      <method />
    </configuration>
  </component>
  <component name="ShelveChangesManager" show_recycled="false">
    <option name="remove_strategy" value="false" />
  </component>
  <component name="TaskManager">
    <task active="true" id="Default" summary="Default task">
      <changelist id="5569a7a7-73ee-4dc0-aec9-3ca6bba507ca" name="Default" comment="" />
      <created>1537505114210</created>
      <option name="number" value="Default" />
      <option name="presentableId" value="Default" />
      <updated>1537505114210</updated>
      <workItem from="1537505115642" duration="3000" />
      <workItem from="1537505260286" duration="25000" />
    </task>
    <servers />
  </component>
  <component name="TimeTrackingManager">
    <option name="totallyTimeSpent" value="28000" />
  </component>
  <component name="ToolWindowManager">
    <frame x="960" y="0" width="960" height="1040" extended-state="0" />
    <layout>
      <window_info id="Project" active="true" anchor="left" auto_hide="false" internal_type="DOCKED" type="DOCKED" visible="true" show_stripe_button="true" weight="0.25" sideWeight="0.5" order="0" side_tool="false" content_ui="combo" />
      <window_info id="TODO" active="false" anchor="bottom" auto_hide="false" internal_type="DOCKED" type="DOCKED" visible="false" show_stripe_button="true" weight="0.33" sideWeight="0.5" order="6" side_tool="false" content_ui="tabs" />
      <window_info id="Event Log" active="false" anchor="bottom" auto_hide="false" internal_type="DOCKED" type="DOCKED" visible="false" show_stripe_button="true" weight="0.33" sideWeight="0.5" order="7" side_tool="true" content_ui="tabs" />
      <window_info id="Database" active="false" anchor="right" auto_hide="false" internal_type="DOCKED" type="DOCKED" visible="false" show_stripe_button="true" weight="0.33" sideWeight="0.5" order="3" side_tool="false" content_ui="tabs" />
      <window_info id="Run" active="false" anchor="bottom" auto_hide="false" internal_type="DOCKED" type="DOCKED" visible="false" show_stripe_button="true" weight="0.33" sideWeight="0.5" order="2" side_tool="false" content_ui="tabs" />
      <window_info id="Version Control" active="false" anchor="bottom" auto_hide="false" internal_type="DOCKED" type="DOCKED" visible="false" show_stripe_button="false" weight="0.33" sideWeight="0.5" order="7" side_tool="false" content_ui="tabs" />
      <window_info id="Structure" active="false" anchor="left" auto_hide="false" internal_type="DOCKED" type="DOCKED" visible="false" show_stripe_button="true" weight="0.25" sideWeight="0.5" order="1" side_tool="false" content_ui="tabs" />
      <window_info id="Terminal" active="false" anchor="bottom" auto_hide="false" internal_type="DOCKED" type="DOCKED" visible="false" show_stripe_button="true" weight="0.33" sideWeight="0.5" order="7" side_tool="false" content_ui="tabs" />
      <window_info id="Debug" active="false" anchor="bottom" auto_hide="false" internal_type="DOCKED" type="DOCKED" visible="false" show_stripe_button="true" weight="0.4" sideWeight="0.5" order="3" side_tool="false" content_ui="tabs" />
      <window_info id="Favorites" active="false" anchor="left" auto_hide="false" internal_type="DOCKED" type="DOCKED" visible="false" show_stripe_button="true" weight="0.33" sideWeight="0.5" order="2" side_tool="true" content_ui="tabs" />
      <window_info id="Cvs" active="false" anchor="bottom" auto_hide="false" internal_type="DOCKED" type="DOCKED" visible="false" show_stripe_button="true" weight="0.25" sideWeight="0.5" order="4" side_tool="false" content_ui="tabs" />
      <window_info id="Message" active="false" anchor="bottom" auto_hide="false" internal_type="DOCKED" type="DOCKED" visible="false" show_stripe_button="true" weight="0.33" sideWeight="0.5" order="0" side_tool="false" content_ui="tabs" />
      <window_info id="Commander" active="false" anchor="right" auto_hide="false" internal_type="DOCKED" type="DOCKED" visible="false" show_stripe_button="true" weight="0.4" sideWeight="0.5" order="0" side_tool="false" content_ui="tabs" />
      <window_info id="Inspection" active="false" anchor="bottom" auto_hide="false" internal_type="DOCKED" type="DOCKED" visible="false" show_stripe_button="true" weight="0.4" sideWeight="0.5" order="5" side_tool="false" content_ui="tabs" />
      <window_info id="Hierarchy" active="false" anchor="right" auto_hide="false" internal_type="DOCKED" type="DOCKED" visible="false" show_stripe_button="true" weight="0.25" sideWeight="0.5" order="2" side_tool="false" content_ui="combo" />
      <window_info id="Find" active="false" anchor="bottom" auto_hide="false" internal_type="DOCKED" type="DOCKED" visible="false" show_stripe_button="true" weight="0.33" sideWeight="0.5" order="1" side_tool="false" content_ui="tabs" />
      <window_info id="Ant Build" active="false" anchor="right" auto_hide="false" internal_type="DOCKED" type="DOCKED" visible="false" show_stripe_button="true" weight="0.25" sideWeight="0.5" order="1" side_tool="false" content_ui="tabs" />
    </layout>
  </component>
  <component name="TypeScriptGeneratedFilesManager">
    <option name="processedProjectFiles" value="true" />
  </component>
  <component name="VcsContentAnnotationSettings">
    <option name="myLimit" value="2678400000" />
  </component>
  <component name="XDebuggerManager">
    <breakpoint-manager />
    <watches-manager />
  </component>
  <component name="editorHistoryManager">
    <entry file="file://$PROJECT_DIR$/index.html">
      <provider selected="true" editor-type-id="text-editor">
        <state relative-caret-position="0">
          <caret line="0" column="0" lean-forward="false" selection-start-line="0" selection-start-column="0" selection-end-line="0" selection-end-column="0" />
          <folding />
        </state>
      </provider>
    </entry>
    <entry file="file://$PROJECT_DIR$/style.css">
      <provider selected="true" editor-type-id="text-editor">
        <state relative-caret-position="0">
          <caret line="0" column="0" lean-forward="false" selection-start-line="0" selection-start-column="0" selection-end-line="0" selection-end-column="0" />
          <folding />
        </state>
      </provider>
    </entry>
  </component>
</project>' > .idea/workspace.xml
	t index.html
	phpstorm64.exe index.html &
}
