<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" method="html" />
  <xsl:include href="chrome.xsl" />
  <xsl:include href="class.xsl" />

  <xsl:template match="/project" name="file">
    <div id="content">
      <xsl:apply-templates select="/project/file[@path=$path]" />
    </div>
    <small class="footer">Documentation was generated by <a href="http://docblox-project.org">DocBlox <xsl:value-of select="$version" /></a>.</small>
  </xsl:template>

  <xsl:template match="/project/file">
    <h1><xsl:value-of select="@path" /></h1>
    <div class="file_menu">
      <xsl:if test="count(include) > 0"><a href="#includes">Includes</a> |</xsl:if>
      <xsl:if test="count(function) > 0"><a href="#functions">Functions</a> |</xsl:if>
      <xsl:if test="count(constant) > 0"><a href="#constants">Constants</a> |</xsl:if>
      <xsl:if test="count(class) > 0"><a href="#classes">Classes</a> |</xsl:if>
      <xsl:if test="count(interface) > 0"><a href="#interfaces">Interfaces</a></xsl:if>
    </div>

    <xsl:if test="docblock/tag">
    <div class="properties">
      <h1>Properties</h1>
      <xsl:for-each select="docblock/tag">
        <xsl:sort select="@name" />
        <label class="property-key"><xsl:value-of select="@name" /></label>
        <div class="property-value"><xsl:value-of select="." /></div>
      </xsl:for-each>
    </div>
    </xsl:if>

    <xsl:if test="docblock/description != '' or docblock/long-description != ''">
      <h2>Description</h2>
    </xsl:if>
    <xsl:if test="docblock/description != ''">
      <xsl:value-of select="docblock/description" disable-output-escaping="yes" /><br />
      <br />
    </xsl:if>
    <xsl:if test="docblock/long-description != ''">
      <xsl:value-of select="docblock/long-description" disable-output-escaping="yes"/><br />
    </xsl:if>

    <xsl:if test="include">
      <a name="includes"/>
      <h2>Includes</h2>
      <xsl:for-each select="include">
        <xsl:value-of select="name" />&#160;<span class="nb-faded-text">(<xsl:value-of select="@type" />)</span><br />
      </xsl:for-each>
    </xsl:if>

    <xsl:if test="function">
      <a name="functions" />
      <h2>Functions</h2>
      <xsl:for-each select="function">
        <xsl:apply-templates select="." />
      </xsl:for-each>
    </xsl:if>

    <xsl:if test="constant">
      <a name="constants" />
      <h2>Constants</h2>
      <xsl:for-each select="constant"><xsl:apply-templates select="." /></xsl:for-each>
    </xsl:if>

    <xsl:if test="class">
      <a name="classes" />
      <h2>Classes</h2>
      <xsl:for-each select="class">
        <div id="{name}" class="class">
          <xsl:apply-templates select="." />
        </div>
      </xsl:for-each>
    </xsl:if>

    <xsl:if test="interface">
      <a name="interfaces" />
      <h2>Interfaces</h2>
      <xsl:for-each select="interface">
        <div id="{name}" class="interface">
          <xsl:apply-templates select="." />
        </div>
      </xsl:for-each>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>