<xsl:stylesheet
        xmlns:nota="http://nota.org/schema/nota"
        xmlns:lebewesen="http://nota.org/schema/lebewesen"
        xmlns:kultur="http://nota.org/schema/kultur"
        xmlns:profession="http://nota.org/schema/profession"
        xmlns:talent="http://nota.org/schema/talent"
        xmlns:aktionen="http://nota.org/schema/kampf/aktionen"
        xmlns:fertigkeit="http://nota.org/schema/fertigkeit"
        xmlns:besonderheit="http://nota.org/schema/besonderheit"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://nota.org/schema/nota ..\..\nota\input\static\schema\nota.xsd
                http://nota.org/schema/lebewesen ..\..\nota\input\static\schema\lebewesen.xsd
                http://nota.org/schema/kampf/aktionen ..\..\nota\input\static\schema\kampf\aktionen.xsd
                http://nota.org/schema/kultur ..\..\nota\input\static\schema\kultur.xsd
                http://nota.org/schema/profession ..\..\nota\input\static\schema\profession.xsd
                http://nota.org/schema/talent ..\..\nota\input\static\schema\talent.xsd
                http://nota.org/schema/fertigkeit ..\..\nota\input\static\schema\fertigkeit.xsd 
                http://nota.org/schema/besonderheit ..\..\nota\input\static\schema\besonderheit.xsd"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="nota:Daten">
    <xsl:apply-templates select="aktionen:Taktiken"/>
  </xsl:template>

  <xsl:template match="aktionen:Taktiken">
    <Aktionen>
      <xsl:apply-templates select="aktionen:Taktik"/>
    </Aktionen>
  </xsl:template>
  <!--Identity template, 
        provides default behavior that copies all content into the output -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()|text()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="text()">
    <xsl:call-template name="replace-variables">
      <xsl:with-param name="text" select="."/>
    </xsl:call-template>
  </xsl:template>


  <xsl:template match="aktionen:Taktik">
    <xsl:variable name="TaktikNum">
      <xsl:number count="aktionen:Taktik" format="1"/>
    </xsl:variable>
    <Aktion>
      <Number><xsl:value-of select="$TaktikNum"/></Number>
      <Original>
        <xsl:copy>
          <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
      </Original>

      <xsl:choose>
        <xsl:when test="./aktionen:Mod/@ModifierType='Bonus'">
          <Bonus>
            <xsl:apply-templates select="aktionen:Mod/*"/>
          </Bonus>
        </xsl:when>
        <xsl:when test="./aktionen:Mod/@ModifierType='Malus'">
          <Malus>
            <xsl:apply-templates select="aktionen:Mod/*"/>
          </Malus>
        </xsl:when>
      </xsl:choose>


    </Aktion>
  </xsl:template>



  <!-- <xsl:template match="*">
    <Error>
      [FEHLER IM XSLT] <xsl:value-of select ="name(.)"/>
    </Error>
  </xsl:template> -->

  <xsl:template match="aktionen:ConcreteModValueType">
    <xsl:value-of select="@Value"/>
    <xsl:if test="@Type='Percent'">%</xsl:if>
  </xsl:template>

  <xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
  <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />


 <xsl:template name="replace-variables">
    <xsl:param name="text"/>
    <xsl:choose>
      <xsl:when test="contains($text,'&#36;x')">
        <xsl:value-of select="substring-before($text,'&#36;x')"/>
        <xsl:value-of select="'&#x1f167;'"/>
        <xsl:call-template name="replace-variables">
          <xsl:with-param name="text" select="substring-after($text,'&#36;x')"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="contains($text,'&#36;y')">
            <xsl:value-of select="substring-before($text,'&#36;y')"/>
            <xsl:value-of select="'&#x1f168;'"/>
            <xsl:call-template name="replace-variables">
              <xsl:with-param name="text" select="substring-after($text,'&#36;y')"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <!-- z -->
            <xsl:choose>
              <xsl:when test="contains($text,'&#36;z')">
                <xsl:value-of select="substring-before($text,'&#36;z')"/>
                <xsl:value-of select="'&#x1f169;'"/>
                <xsl:call-template name="replace-variables">
                  <xsl:with-param name="text" select="substring-after($text,'&#36;z')"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <!--a-->
                <xsl:choose>
                  <xsl:when test="contains($text,'&#36;a')">
                    <xsl:value-of select="substring-before($text,'&#36;a')"/>
                    <xsl:value-of select="'&#127312;'"/>
                    <xsl:call-template name="replace-variables">
                      <xsl:with-param name="text" select="substring-after($text,'&#36;a')"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>

                    <!--b-->
                    <xsl:choose>
                      <xsl:when test="contains($text,'&#36;b')">
                        <xsl:value-of select="substring-before($text,'&#36;b')"/>
                        <xsl:value-of select="'&#127313;'"/>
                        <xsl:call-template name="replace-variables">
                          <xsl:with-param name="text" select="substring-after($text,'&#36;b')"/>
                        </xsl:call-template>
                      </xsl:when>
                      <xsl:otherwise>

                        <!--c-->
                        <xsl:choose>
                          <xsl:when test="contains($text,'&#36;c')">
                            <xsl:value-of select="substring-before($text,'&#36;c')"/>
                            <xsl:value-of select="'&#127314;'"/>
                            <xsl:call-template name="replace-variables">
                              <xsl:with-param name="text" select="substring-after($text,'&#36;c')"/>
                            </xsl:call-template>
                          </xsl:when>
                          <xsl:otherwise>
                            <!--d-->
                            <xsl:choose>
                              <xsl:when test="contains($text,'&#36;d')">
                                <xsl:value-of select="substring-before($text,'&#36;d')"/>
                                <xsl:value-of select="'&#127315;'"/>
                                <xsl:call-template name="replace-variables">
                                  <xsl:with-param name="text" select="substring-after($text,'&#36;d')"/>
                                </xsl:call-template>
                              </xsl:when>
                              <xsl:otherwise>

                                <!--e-->
                                <xsl:choose>
                                  <xsl:when test="contains($text,'&#36;e')">
                                    <xsl:value-of select="substring-before($text,'&#36;e')"/>
                                    <xsl:value-of select="'&#127316;'"/>
                                    <xsl:call-template name="replace-variables">
                                      <xsl:with-param name="text" select="substring-after($text,'&#36;e')"/>
                                    </xsl:call-template>
                                  </xsl:when>
                                  <xsl:otherwise>

                                    <!--f-->
                                    <xsl:choose>
                                      <xsl:when test="contains($text,'&#36;f')">
                                        <xsl:value-of select="substring-before($text,'&#36;f')"/>
                                        <xsl:value-of select="'&#127317;'"/>
                                        <xsl:call-template name="replace-variables">
                                          <xsl:with-param name="text" select="substring-after($text,'&#36;f')"/>
                                        </xsl:call-template>
                                      </xsl:when>
                                      <xsl:otherwise>

                                        <!--g-->
                                        <xsl:choose>
                                          <xsl:when test="contains($text,'&#36;g')">
                                            <xsl:value-of select="substring-before($text,'&#36;g')"/>
                                            <xsl:value-of select="'&#127318;'"/>
                                            <xsl:call-template name="replace-variables">
                                              <xsl:with-param name="text" select="substring-after($text,'&#36;g')"/>
                                            </xsl:call-template>
                                          </xsl:when>
                                          <xsl:otherwise>

                                            <!--h-->
                                            <xsl:choose>
                                              <xsl:when test="contains($text,'&#36;h')">
                                                <xsl:value-of select="substring-before($text,'&#36;h')"/>
                                                <xsl:value-of select="'&#127319;'"/>
                                                <xsl:call-template name="replace-variables">
                                                  <xsl:with-param name="text" select="substring-after($text,'&#36;h')"/>
                                                </xsl:call-template>
                                              </xsl:when>
                                              <xsl:otherwise>

                                                <!--i-->
                                                <xsl:choose>
                                                  <xsl:when test="contains($text,'&#36;i')">
                                                    <xsl:value-of select="substring-before($text,'&#36;i')"/>
                                                    <xsl:value-of select="'&#127320;'"/>
                                                    <xsl:call-template name="replace-variables">
                                                      <xsl:with-param name="text" select="substring-after($text,'&#36;i')"/>
                                                    </xsl:call-template>
                                                  </xsl:when>
                                                  <xsl:otherwise>

                                                    <!--j-->
                                                    <xsl:choose>
                                                      <xsl:when test="contains($text,'&#36;j')">
                                                        <xsl:value-of select="substring-before($text,'&#36;j')"/>
                                                        <xsl:value-of select="'&#127321;'"/>
                                                        <xsl:call-template name="replace-variables">
                                                          <xsl:with-param name="text" select="substring-after($text,'&#36;j')"/>
                                                        </xsl:call-template>
                                                      </xsl:when>
                                                      <xsl:otherwise>

                                                        <!--k-->
                                                        <xsl:choose>
                                                          <xsl:when test="contains($text,'&#36;k')">
                                                            <xsl:value-of select="substring-before($text,'&#36;k')"/>
                                                            <xsl:value-of select="'&#127322;'"/>
                                                            <xsl:call-template name="replace-variables">
                                                              <xsl:with-param name="text" select="substring-after($text,'&#36;k')"/>
                                                            </xsl:call-template>
                                                          </xsl:when>
                                                          <xsl:otherwise>

                                                            <!--l-->
                                                            <xsl:choose>
                                                              <xsl:when test="contains($text,'&#36;l')">
                                                                <xsl:value-of select="substring-before($text,'&#36;l')"/>
                                                                <xsl:value-of select="'&#127323;'"/>
                                                                <xsl:call-template name="replace-variables">
                                                                  <xsl:with-param name="text" select="substring-after($text,'&#36;l')"/>
                                                                </xsl:call-template>
                                                              </xsl:when>
                                                              <xsl:otherwise>
                                                               

                                                            <!--m-->
                                                            <xsl:choose>
                                                              <xsl:when test="contains($text,'&#36;m')">
                                                                <xsl:value-of select="substring-before($text,'&#36;m')"/>
                                                                <xsl:value-of select="'&#127324;'"/>
                                                                <xsl:call-template name="replace-variables">
                                                                  <xsl:with-param name="text" select="substring-after($text,'&#36;m')"/>
                                                                </xsl:call-template>
                                                              </xsl:when>
                                                              <xsl:otherwise>

                                                                <!--n-->
                                                                <xsl:choose>
                                                                  <xsl:when test="contains($text,'&#36;n')">
                                                                    <xsl:value-of select="substring-before($text,'&#36;n')"/>
                                                                    <xsl:value-of select="'&#127325;'"/>
                                                                    <xsl:call-template name="replace-variables">
                                                                      <xsl:with-param name="text" select="substring-after($text,'&#36;n')"/>
                                                                    </xsl:call-template>
                                                                  </xsl:when>
                                                                  <xsl:otherwise>

                                                                    <!--o-->
                                                                    <xsl:choose>
                                                                      <xsl:when test="contains($text,'&#36;o')">
                                                                        <xsl:value-of select="substring-before($text,'&#36;o')"/>
                                                                        <xsl:value-of select="'&#127326;'"/>
                                                                        <xsl:call-template name="replace-variables">
                                                                          <xsl:with-param name="text" select="substring-after($text,'&#36;o')"/>
                                                                        </xsl:call-template>
                                                                      </xsl:when>
                                                                      <xsl:otherwise>

                                                                        <!--p-->
                                                                        <xsl:choose>
                                                                          <xsl:when test="contains($text,'&#36;p')">
                                                                            <xsl:value-of select="substring-before($text,'&#36;p')"/>
                                                                            <xsl:value-of select="'&#127327;'"/>
                                                                            <xsl:call-template name="replace-variables">
                                                                              <xsl:with-param name="text" select="substring-after($text,'&#36;p')"/>
                                                                            </xsl:call-template>
                                                                          </xsl:when>
                                                                          <xsl:otherwise>

                                                                            <!--q-->
                                                                            <xsl:choose>
                                                                              <xsl:when test="contains($text,'&#36;q')">
                                                                                <xsl:value-of select="substring-before($text,'&#36;q')"/>
                                                                                <xsl:value-of select="'&#127328;'"/>
                                                                                <xsl:call-template name="replace-variables">
                                                                                  <xsl:with-param name="text" select="substring-after($text,'&#36;q')"/>
                                                                                </xsl:call-template>
                                                                              </xsl:when>
                                                                              <xsl:otherwise>

                                                                                <!--r-->
                                                                                <xsl:choose>
                                                                                  <xsl:when test="contains($text,'&#36;r')">
                                                                                    <xsl:value-of select="substring-before($text,'&#36;r')"/>
                                                                                    <xsl:value-of select="'&#127329;'"/>
                                                                                    <xsl:call-template name="replace-variables">
                                                                                      <xsl:with-param name="text" select="substring-after($text,'&#36;r')"/>
                                                                                    </xsl:call-template>
                                                                                  </xsl:when>
                                                                                  <xsl:otherwise>

                                                                                    <!--s-->
                                                                                    <xsl:choose>
                                                                                      <xsl:when test="contains($text,'&#36;s')">
                                                                                        <xsl:value-of select="substring-before($text,'&#36;s')"/>
                                                                                        <xsl:value-of select="'&#127330;'"/>
                                                                                        <xsl:call-template name="replace-variables">
                                                                                          <xsl:with-param name="text" select="substring-after($text,'&#36;s')"/>
                                                                                        </xsl:call-template>
                                                                                      </xsl:when>
                                                                                      <xsl:otherwise>

                                                                                        <!--t-->
                                                                                        <xsl:choose>
                                                                                          <xsl:when test="contains($text,'&#36;t')">
                                                                                            <xsl:value-of select="substring-before($text,'&#36;t')"/>
                                                                                            <xsl:value-of select="'&#127331;'"/>
                                                                                            <xsl:call-template name="replace-variables">
                                                                                              <xsl:with-param name="text" select="substring-after($text,'&#36;t')"/>
                                                                                            </xsl:call-template>
                                                                                          </xsl:when>
                                                                                          <xsl:otherwise>

                                                                                            <!--u-->
                                                                                            <xsl:choose>
                                                                                              <xsl:when test="contains($text,'&#36;u')">
                                                                                                <xsl:value-of select="substring-before($text,'&#36;u')"/>
                                                                                                <xsl:value-of select="'&#127332;'"/>
                                                                                                <xsl:call-template name="replace-variables">
                                                                                                  <xsl:with-param name="text" select="substring-after($text,'&#36;u')"/>
                                                                                                </xsl:call-template>
                                                                                              </xsl:when>
                                                                                              <xsl:otherwise>

                                                                                                <!--v-->
                                                                                                <xsl:choose>
                                                                                                  <xsl:when test="contains($text,'&#36;v')">
                                                                                                    <xsl:value-of select="substring-before($text,'&#36;v')"/>
                                                                                                    <xsl:value-of select="'&#127333;'"/>
                                                                                                    <xsl:call-template name="replace-variables">
                                                                                                      <xsl:with-param name="text" select="substring-after($text,'&#36;v')"/>
                                                                                                    </xsl:call-template>
                                                                                                  </xsl:when>
                                                                                                  <xsl:otherwise>

                                                                                                    <!--w-->
                                                                                                    <xsl:choose>
                                                                                                      <xsl:when test="contains($text,'&#36;w')">
                                                                                                        <xsl:value-of select="substring-before($text,'&#36;w')"/>
                                                                                                        <xsl:value-of select="'&#127334;'"/>
                                                                                                        <xsl:call-template name="replace-variables">
                                                                                                          <xsl:with-param name="text" select="substring-after($text,'&#36;w')"/>
                                                                                                        </xsl:call-template>
                                                                                                      </xsl:when>
                                                                                                      <xsl:otherwise>
                                                                                                        <xsl:value-of select="$text"/>
                                                                                                      </xsl:otherwise>
                                                                                                    </xsl:choose>
                                                                                                  </xsl:otherwise>
                                                                                                </xsl:choose>
                                                                                              </xsl:otherwise>
                                                                                            </xsl:choose>
                                                                                          </xsl:otherwise>
                                                                                        </xsl:choose>
                                                                                      </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                  </xsl:otherwise>
                                                                                </xsl:choose>
                                                                              </xsl:otherwise>
                                                                            </xsl:choose>
                                                                          </xsl:otherwise>
                                                                        </xsl:choose>
                                                                      </xsl:otherwise>
                                                                    </xsl:choose>
                                                                  </xsl:otherwise>
                                                                </xsl:choose>
                                                              </xsl:otherwise>
                                                            </xsl:choose>
                                                          </xsl:otherwise>
                                                        </xsl:choose>
                                                      </xsl:otherwise>
                                                    </xsl:choose>
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                              </xsl:otherwise>
                                            </xsl:choose>
                                          </xsl:otherwise>
                                        </xsl:choose>
                                      </xsl:otherwise>
                                    </xsl:choose>
                                  </xsl:otherwise>
                                </xsl:choose>
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
    
                                                              </xsl:otherwise>
                                                            </xsl:choose>
  </xsl:template>

  <xsl:template match="aktionen:VariableModValueType">
    <!-- <xsl:value-of select="@Value"/> -->
    <xsl:choose>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='a'">&#x1f150;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='b'">&#x1f151;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='c'">&#x1f152;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='d'">&#x1f153;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='e'">&#x1f154;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='f'">&#x1f155;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='g'">&#x1f156;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='h'">&#x1f157;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='i'">&#x1f158;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='j'">&#x1f159;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='k'">&#x1f15a;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='l'">&#x1f15b;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='m'">&#x1f15c;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='n'">&#x1f15d;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='o'">&#x1f15e;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='p'">&#x1f15f;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='q'">&#x1f160;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='r'">&#x1f161;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='s'">&#x1f162;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='t'">&#x1f163;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='u'">&#x1f164;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='v'">&#x1f165;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='w'">&#x1f166;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='x'">&#x1f167;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='y'">&#x1f168;</xsl:when>
      <xsl:when test="translate(@Value, $uppercase, $lowercase)='z'">&#x1f169;</xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="aktionen:AddModValueType">
    <xsl:apply-templates select="./*[1]"/><xsl:for-each select="./*[position()>1]"> + <xsl:apply-templates select="."/></xsl:for-each>
  </xsl:template>

  <xsl:template match="aktionen:SubstractModValueType">
    <xsl:apply-templates select="./*[1]"/><xsl:for-each select="./*[position()>1]"> - <xsl:apply-templates select="."/></xsl:for-each>
  </xsl:template>

  <xsl:template match="aktionen:MultiplyModValueType">
    <xsl:apply-templates select="./*[1]"/><xsl:for-each select="./*[position()>1]"> &#8226; <xsl:apply-templates select="."/></xsl:for-each>
  </xsl:template>

  <!-- <xsl:template match="*">
    [[FEHLER IM XSLT]] (<xsl:value-of select="local-name()"/>)
  </xsl:template> -->


</xsl:stylesheet>