<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:py="pyNS"
    >
	<xsl:output encoding="ISO-8859-1"/>
	<xsl:param name="country" select="'DE'"/>
	<xsl:param name="language" select="'de'"/>
	<xsl:param name="co_objectid" select="'#'"/>
	<xsl:param name="media_type" select="'all'"/>
    <xsl:param name="access_mode" select="'internal'"/>
    <xsl:param name="destination" select="web"/>
    <xsl:param name="module" select="/document/header/@module"/>
    <xsl:param name="orientation" select="/document/header/@orientation"/>
    <xsl:param name="pagelayout" select="/document/header/@layout"/>
    <xsl:param name="pagetitle" select="/document/content/title/text()"/>
	<xsl:param name="show_de_control_layer" select="/document/header/@show_de_control_layer"/>

	
	<xsl:template match="document">
	    <div>
	        <xsl:apply-templates select="content"/>
	    </div>
	    <div>
	        <xsl:apply-templates select="header"/>
	    </div>
	</xsl:template>
	
	<xsl:template match="header">
		<div __bxe_id="{@__bxe_id}" class="header" style="">
            <div class="headervalue" style="color: red; font-weight: bold;">objectid: <xsl:value-of select="$co_objectid"/></div>
            <div class="headervalue" style="color: red; font-weight: bold;">language: <xsl:value-of select="$language"/></div>            
	        <div class="headervalue" style="color: black; font-weight: bold;">shorttitle: <xsl:value-of select="shorttitle"/></div>
	        <div class="headervalue" style="color: gray;">@intern: <xsl:value-of select="keywords"/></div>
	        <div class="headervalue" style="color: red;">@repro: <xsl:value-of select="docnotes"/></div>
		</div>
	</xsl:template>

	<xsl:template match="content">
		<xsl:variable name="height">
			<xsl:choose>
				<xsl:when test="$media_type = 'online' or $show_de_control_layer = 'yes'">min-height: 1461px;</xsl:when>
				<xsl:otherwise> height: 1461px; max-height: 1461px;</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="height2">
			<xsl:choose>
				<xsl:when test="$media_type = 'online' or $show_de_control_layer = 'yes'">min-height: 1425px;</xsl:when>
				<xsl:otherwise> height: 1425px; max-height: 1425px;</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="inner_height">
			<xsl:choose>
				<xsl:when test="$media_type = 'online' or $show_de_control_layer = 'yes'">min-height: 1425px;</xsl:when>
				<xsl:otherwise>height: 1425px; max-height: 1425px;</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div class="mod_{$module}" style="padding-bottom: 1px;">
			<xsl:choose>
				<xsl:when test="$orientation = 'left'">
					<!-- height is 1425 but we have to add 36 px because of status panel of bxe (only edit mode xslt!) -->
					<xsl:attribute name="style">
						background: transparent url(/_rsc/_cope2/co_types/catalogpage_1/gfx/background_left.png) no-repeat;
						position: absolute;
						z-index: 1;
						top: 46px; left: 0px; width: 1025px;<xsl:value-of select="$height"/>
					</xsl:attribute>
					<xsl:choose>
						<xsl:when test="/document/header/@infopage = 'yes'">
							<div class="infobox" style="position: absolute; z-index: 2; top: 0px; left: 0px; width: 60px; height: 60px; min-height: 60px;">&#160;</div>
							<div class="module_color" style="position: absolute; z-index: 2; top: 200px; left: 0px; width: 60px; height: 300px;">&#160;</div>
						</xsl:when>
						<xsl:otherwise>
							<div class="module_icon" style="position: absolute; z-index: 2; top: 0px; left: 0px; width: 60px; height: 60px;">&#160;</div>
							<div class="module_color" style="position: absolute; z-index: 2; top: 200px; left: 0px; width: 20px; height: 40px;">&#160;</div>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="style">
						background: transparent url(/_rsc/_cope2/co_types/catalogpage_1/gfx/background_right.png) no-repeat;
						position: absolute;
						z-index: 1;
						top: 46px; left: 0px; width: 1025px;<xsl:value-of select="$height"/>
					</xsl:attribute>
					<xsl:choose>
						<xsl:when test="/document/header/@infopage = 'yes'">
							<div class="infobox" style="position: absolute; z-index: 2; top: 0px; left: 965px; width: 60px; height: 60px; min-height: 60px;">&#160;</div>
							<div class="module_color" style="position: absolute; z-index: 2; top: 200px; left: 965px; width: 60px; height: 300px;">&#160;</div>
						</xsl:when>
						<xsl:otherwise>
							<div class="module_icon" style="position: absolute; z-index: 2; top: 0px; left: 965px; width: 60px; height: 60px;">&#160;</div>
							<div class="module_color" style="position: absolute; z-index: 2; top: 200px; left: 1005px; width: 20px; height: 40px;">&#160;</div>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
			<div style="-moz-opacity: 1.0; z-index: 4;">
				<xsl:choose>
					<xsl:when test="$orientation = 'left'">
						<xsl:choose>
							<xsl:when test="/document/header/@show_de_control_layer = 'yes'">
								<div>
									<xsl:attribute name="style">
										background: transparent url(./self.png?orientation=left&amp;language=de&amp;random=<xsl:value-of select="generate-id(.)"/>) no-repeat;
										position: absolute;
										z-index: 0;
										top: 0px; left: 0px; width: 1025px;<xsl:value-of select="$inner_height"/>
										-moz-opacity: 0.5;
									</xsl:attribute>
									control layer de
								</div>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="/document/header/@show_grid = 'yes'">
										<xsl:choose>
											<xsl:when test="/document/header/@layout = '3-rows'">
												<xsl:attribute name="style">
													background: transparent url(/_rsc/_cope2/co_types/catalogpage_1/gfx/grid_3_rows_left.png) no-repeat;
													position: absolute;
													z-index: 3;
													top: 0px; left: 0px; width: 1025px;<xsl:value-of select="$height2"/>
												</xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<xsl:attribute name="style">
													background: transparent url(/_rsc/_cope2/co_types/catalogpage_1/gfx/grid_4_rows_left.png) no-repeat;
													position: absolute;
													z-index: 3;
													top: 0px; left: 0px; width: 1025px;<xsl:value-of select="$height2"/>
												</xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
								
							</xsl:otherwise>
						</xsl:choose>
						
						<div class="pagetitle" style="
							left: 150px;
							text-align: left;"
							>
							<xsl:value-of select="title"/>
						</div>
						<div class="co_content" style="
							position: absolute; top: 200px; left: 150px;
							width: 800px; {$inner_height}"
							>
							<xsl:apply-templates/>
						</div>
					</xsl:when>
					<xsl:otherwise>
	
						<xsl:choose>
							<xsl:when test="/document/header/@show_de_control_layer = 'yes'">
								<div>
									<xsl:attribute name="style">
										background: transparent url(./self.png?orientation=right&amp;language=de&amp;random=<xsl:value-of select="generate-id(.)"/>) no-repeat;
										position: absolute;
										z-index: 0;
										top: 0px; left: 0px; width: 1025px;<xsl:value-of select="$inner_height"/>
										-moz-opacity: 0.5;
									</xsl:attribute>
									control layer de
								</div>
							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="/document/header/@show_grid = 'yes'">
										<xsl:choose>
											<xsl:when test="/document/header/@layout = '3-rows'">
												<xsl:attribute name="style">
													background: transparent url(/_rsc/_cope2/co_types/catalogpage_1/gfx/grid_3_rows_right.png) no-repeat;
													position: absolute;
													z-index: 3;
													top: 0px; left: 0px; width: 1025px;<xsl:value-of select="$height2"/>
												</xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<xsl:attribute name="style">
													background: transparent url(/_rsc/_cope2/co_types/catalogpage_1/gfx/grid_4_rows_right.png) no-repeat;
													position: absolute;
													z-index: 3;
													top: 0px; left: 0px; width: 1025px;<xsl:value-of select="$height2"/>
												</xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
						
						<div class="pagetitle" style="
							left: 75px;
							text-align: right;"
							>
							<xsl:value-of select="title"/>
						</div>
						<div class="co_content" style="
							position: absolute; top: 200px; left: 75px;
							width: 800px; {$inner_height}"
							>
							<xsl:apply-templates/>
						</div>
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>
	</xsl:template>
	
	<xsl:template match="horizontal_box">
	        <table __bxe_id="{@__bxe_id}" class="horizontal_box" width="820px" cellpadding="0" cellspacing="0">
				<xsl:if test="/document/header/@show_grid = 'yes'">
					<xsl:attribute name="style">
						border-top: 1px solid #00D2FF;
						border-bottom: 1px solid #00D2FF;
					</xsl:attribute>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="@layout = 'inside-to-outside'">
						<tr>
							<xsl:choose>
								<xsl:when test="$orientation = 'right'">
									<xsl:for-each select="block">
										<xsl:call-template name="_block_in_horizontal_box"/>
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<xsl:for-each select="block">
										<xsl:sort select="position()" data-type="number" order="descending"/>
										<xsl:call-template name="_block_in_horizontal_box"/>
									</xsl:for-each>
								</xsl:otherwise>
							</xsl:choose>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr>
							<xsl:for-each select="block">
								<xsl:call-template name="_block_in_horizontal_box"/>
							</xsl:for-each>
						</tr>
					</xsl:otherwise>
		        </xsl:choose>
		    </table>
			<div>
				<!-- deprecated since new cata-layout 2007/2
				<xsl:if test="@horizontal_delimiter = 'yes'">
					<xsl:attribute name="style">background: transparent url(/_rsc/_cope2/co_types/catalogpage_1/gfx/horizontal_block_delimiter.png) top left repeat-x;</xsl:attribute>
				</xsl:if>
				-->
				<xsl:choose>
	    			<xsl:when test="@bottom_space">
		       		    <img src="/_rsc/gfx/spacer.gif" width="19" height="{round(@bottom_space * 5)}"/>
					</xsl:when>
	                <xsl:otherwise>
	                    <img src="/_rsc/gfx/spacer.gif" width="19" height="19"/>
	                </xsl:otherwise>
                </xsl:choose>
			</div>
	</xsl:template>
	
	<xsl:template name="_block_in_horizontal_box">
		<td class="block" align="">
			<!--
				alignment: we also have an 'inside' and 'outside' alignment,
				so we have to calculate in relation to page orientation [left or right]...
			-->
			<xsl:variable name="border">
				<xsl:choose>
					<xsl:when test="/document/header/@show_grid = 'yes'">
						1px dotted gray;
					</xsl:when>
					<xsl:otherwise>
						border: 0;
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="@align='left' or @align='right'">
					<xsl:attribute name="align"><xsl:value-of select="@align"/></xsl:attribute>
				</xsl:when>
				<xsl:when test="@align='inside' and $orientation='left'">
					<xsl:attribute name="align">right</xsl:attribute>
				</xsl:when>
				<xsl:when test="@align='inside' and $orientation='right'">
					<xsl:attribute name="align">left</xsl:attribute>
				</xsl:when>
				<xsl:when test="@align='outside' and $orientation='left'">
					<xsl:attribute name="align">left</xsl:attribute>
				</xsl:when>
				<xsl:when test="@align='outside' and $orientation='right'">
					<xsl:attribute name="align">right</xsl:attribute>
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="@valign='middle'">
					<xsl:attribute name="valign">middle</xsl:attribute>
				</xsl:when>
				<xsl:when test="@valign='bottom'">
					<xsl:attribute name="valign">bottom</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="valign">top</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$pagelayout = '3-rows'">
					<xsl:variable name="width" select="273 * @colspan - 20"/>
					<xsl:attribute name="style">width: <xsl:value-of select="$width"/>px; min-width: <xsl:value-of select="$width"/>px;	max-width: <xsl:value-of select="$width"/>px; border: <xsl:value-of select="$border"/>;</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="width" select="204 * @colspan - 20"/>
					<xsl:attribute name="style">width: <xsl:value-of select="$width"/>px; min-width: <xsl:value-of select="$width"/>px;	max-width: <xsl:value-of select="$width"/>px; border: <xsl:value-of select="$border"/>;</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates/>
		</td>
		<xsl:variable name="style">
			<!-- deprecated since new cata-layout 2007/2
			<xsl:choose>
				<xsl:when test="../@vertical_delimiter = 'yes' and not(position() = last())">
					background: transparent url(/_rsc/_cope2/co_types/catalogpage_1/gfx/vertical_block_delimiter.png) top left repeat-y;
				</xsl:when>
				<xsl:otherwise>
					background-color: transparent;
				</xsl:otherwise>
			</xsl:choose>
			-->
			background-color: transparent;
		</xsl:variable>
		<td style="{$style}" width="19"><img src="/_rsc/gfx/spacer.gif" width="19" height="1"/></td>
	</xsl:template>
	
	
	<xsl:template match="accessories_table">
		<xsl:call-template name="order_table">
			<xsl:with-param name="table_type">horizontal</xsl:with-param>			
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="order_table_h">
		<xsl:call-template name="order_table">
			<xsl:with-param name="table_type">horizontal</xsl:with-param>			
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template match="order_table_v">
		<xsl:call-template name="order_table">
			<xsl:with-param name="table_type">vertical</xsl:with-param>			
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="order_table">
		<xsl:param name="table_type"></xsl:param>
	    <table __bxe_id="{@__bxe_id}" class="pt" colheaders="{@colheaders}" style="width: 100%;" cellpadding="0" cellspacing="0">
			<xsl:apply-templates select="colgroup"/>
            <xsl:for-each select="row">
                <tr __bxe_id="{@__bxe_id}" >
					<xsl:choose>
						<xsl:when test="$table_type = 'vertical'">
							<xsl:choose>
								<xsl:when test="@type = 'product ID'">							
									<xsl:attribute name="class">color40</xsl:attribute>
								</xsl:when>
								<xsl:when test="@type = 'product name'">
									<xsl:attribute name="class">color40</xsl:attribute>
								</xsl:when>
								<xsl:when test="@type = 'product price'">
									<xsl:attribute name="class">color20</xsl:attribute>
								</xsl:when>
								<xsl:when test="@color = 'transparent'">
									<xsl:attribute name="class">transparent</xsl:attribute>
								</xsl:when>
								<xsl:when test="@color = 'darkgray'"> <!-- deprecated  -->
									<xsl:attribute name="class">darkgray</xsl:attribute>
								</xsl:when>
								<xsl:when test="@color = 'color40'">
									<xsl:attribute name="class">color40</xsl:attribute>
								</xsl:when>
								<xsl:when test="@color = 'color20'">
									<xsl:attribute name="class">color20</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="class">gray</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="$table_type = 'horizontal'">
							<xsl:choose>
								<xsl:when test="@type = 'header'">
									<xsl:attribute name="class">color40 bold</xsl:attribute>
								</xsl:when>
								<xsl:when test="@color = 'transparent'">
									<xsl:attribute name="class">transparent</xsl:attribute>
								</xsl:when>
								<xsl:when test="@color = 'darkgray'">
									<xsl:attribute name="class">darkgray</xsl:attribute>
								</xsl:when>
								<xsl:when test="@color = 'color40'">
									<xsl:attribute name="class">color40</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="class">color20</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="class">gray</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
                    <xsl:for-each select="cell">
                        <td>
							<xsl:choose>
								<xsl:when test="@color = 'transparent'">
									<xsl:attribute name="class">transparent</xsl:attribute>
								</xsl:when>
								<xsl:when test="@color = 'darkgray'">
									<xsl:attribute name="class">darkgray</xsl:attribute>
								</xsl:when>
								<xsl:when test="@color = 'color40'">
									<xsl:attribute name="class">color40</xsl:attribute>
								</xsl:when>
								<xsl:when test="@color = 'color20'">
									<xsl:attribute name="class">color20</xsl:attribute>
								</xsl:when>
								<xsl:when test="/document/header/@show_de_control_layer = 'yes'">
									<xsl:attribute name="style">background-color: transparent</xsl:attribute>
								</xsl:when>
								<xsl:otherwise>
									<xsl:attribute name="class">automatic</xsl:attribute>
								</xsl:otherwise>
							</xsl:choose>
                            <xsl:for-each select="@*">
                                <xsl:copy/>
                            </xsl:for-each>
							<xsl:choose>
								<xsl:when test="$table_type = 'horizontal'">
								    <xsl:choose>
                                        <xsl:when test="@c_purpose and @c_type">
                                            <xsl:choose>
                                                <xsl:when test="@c_purpose = 'product price' and @c_type = 'value'">
                                                    <xsl:attribute name="align">right</xsl:attribute>
                                                    <span class="cell horz price ctype"><xsl:apply-templates/></span>
                                                </xsl:when>
                                                <xsl:when test="@c_purpose = 'product ID' and @c_type = 'value'">
                                                    <span class="cell col1 id ctype"><xsl:apply-templates/></span>
                                                </xsl:when>
                                                <xsl:when test="@c_purpose = 'product price'">
                                                    <xsl:attribute name="align">right</xsl:attribute>
                                                    <span class="cell horz price"><xsl:apply-templates/></span>
                                                </xsl:when>
                                                <xsl:when test="@c_purpose = 'product ID'">
                                                    <span class="cell col1 id"><xsl:apply-templates/></span>
                                                </xsl:when>
                                                <xsl:when test="@c_type = 'text'">
                                                    <span class="cell"><xsl:apply-templates/></span>
                                                </xsl:when>
                                                <xsl:when test="position() = 1">
                                                    <span class="cell col1"><xsl:apply-templates/></span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <span class="cell"><xsl:apply-templates/></span>
                                                </xsl:otherwise>
                                            </xsl:choose>                                        
                                        </xsl:when>
                                        <xsl:otherwise>
											<xsl:choose>
												<xsl:when test="@type = 'product price'">
													<xsl:attribute name="align">right</xsl:attribute>
													<span class="cell price horz"><xsl:apply-templates/></span>
												</xsl:when>
												<xsl:when test="@type = 'product ID'">
		                                            <span class="cell col1 id"><xsl:apply-templates/></span>
		                                        </xsl:when>
		                                        <xsl:when test="@c_type = 'text'">
                                                    <span class="cell"><xsl:apply-templates/></span>
                                                </xsl:when>
												<xsl:when test="position() = 1">
													<span class="cell col1"><xsl:apply-templates/></span>
												</xsl:when>
												<xsl:otherwise>
													<span class="cell"><xsl:apply-templates/></span>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
                                    </xsl:choose>
								</xsl:when>
								<xsl:otherwise>
								    <xsl:choose>
                                        <xsl:when test="@c_purpose and @c_type">
                                            <xsl:choose>
                                                <xsl:when test="@c_purpose = 'product price' and @c_type = 'value'">
                                                    <span class="cell vert price ctype"><xsl:apply-templates/></span>
                                                </xsl:when>
                                                <xsl:when test="@c_purpose = 'product ID' and @c_type = 'value'">
                                                    <span class="cell id vert ctype"><xsl:apply-templates/></span>
                                                </xsl:when>
                                                <xsl:when test="@c_purpose = 'product price'">
                                                    <span class="cell vert price"><xsl:apply-templates/></span>
                                                </xsl:when>
                                                <xsl:when test="@c_purpose = 'product name'">
                                                    <span class="cell vert name"><xsl:apply-templates/></span>
                                                </xsl:when>
                                                <xsl:when test="@c_purpose = 'product ID'">
                                                    <span class="cell vert id"><xsl:apply-templates/></span>
                                                </xsl:when>
                                                <xsl:when test="@c_type = 'text'">
                                                    <span class="cell"><xsl:apply-templates/></span>
                                                </xsl:when>
                                                <xsl:when test="position() = 1">
                                                    <span class="cell col1"><xsl:apply-templates/></span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <span class="cell"><xsl:apply-templates/></span>
                                                </xsl:otherwise>
                                            </xsl:choose>                                        
                                        </xsl:when>
                                        <xsl:otherwise>
											<xsl:choose>
												<xsl:when test="@type = 'product price'">
													<span class="cell price vert"><xsl:apply-templates/></span>
												</xsl:when>
		                                        <xsl:when test="@type = 'product name'">
		                                            <span class="cell name vert"><xsl:apply-templates/></span>
		                                        </xsl:when>
		                                        <xsl:when test="@type = 'product ID'">
		                                            <span class="cell id vert"><xsl:apply-templates/></span>
		                                        </xsl:when>
		                                        <xsl:when test="@c_type = 'text'">
                                                    <span class="cell"><xsl:apply-templates/></span>
                                                </xsl:when>
												<xsl:when test="position() = 1">
													<span class="cell col1"><xsl:apply-templates/></span>
												</xsl:when>
												<xsl:otherwise>
													<span class="cell"><xsl:apply-templates/></span>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
                        </td>
                    </xsl:for-each>
                </tr>
            </xsl:for-each>
	    </table>
	</xsl:template>

	<xsl:template match="colgroup">
		<colgroup>
			<xsl:for-each select="col">
				<xsl:choose>
					<xsl:when test="round(@width) > 0">
						<col width="{round(@width * 5)}"/>
					</xsl:when>
					<xsl:otherwise>
						<col/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</colgroup>
		<xsl:if test="/document/header/@show_de_control_layer = 'no' and /document/header/@show_table_headers = 'yes'">
			<tr __bxe_id="{@__bxe_id}" style="background: #eee url(/_rsc/_cope2/co_types/catalogpage_1/gfx/ruler_t50.png) left bottom no-repeat;">
				<xsl:for-each select="col">
					<td __bxe_id="{@__bxe_id}" style="border-left: 1px solid red; padding-left: 0.5em;">
						c<xsl:value-of select="position()"/>:
					</td>
				</xsl:for-each>			
			</tr>
		</xsl:if>
	</xsl:template>

	<xsl:template match="table">
	    <table class="informaltable" borderlines="{@borderlines}" colheaders="{@colheaders}">
            <xsl:for-each select="tr">
                <tr>
                    <xsl:for-each select="td">
                        <td class="informaltable">
                            <xsl:for-each select="@*">
                                <xsl:copy/>
                            </xsl:for-each>
                            <xsl:apply-templates/>
                        </td>
                    </xsl:for-each>
                </tr>
            </xsl:for-each>
	    </table>
	</xsl:template>
	
	<xsl:template match="color_scheme">
		<span __bxe_id="{@__bxe_id}" class="color_scheme" style="border: 1px dotted red;">
			<xsl:choose>
				<xsl:when test="@color_code = 'K100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/k100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'K100+K100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/k100+k100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'C100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/c100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'M100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/m100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'Y100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/y100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'R100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/r100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'G100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/g100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'B100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/b100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'OR100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/or100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'K50'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/k50.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'GR50'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/gr50.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'C50'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/c50.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'M50'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/m50.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'Y50'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/y50.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'C100,M100,Y100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/c100m100y100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'C100,M100,Y100+C100,M100,Y100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/c100m100y100+c100m100y100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'C50,M50,Y100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/c50m50y100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'C50,C50,K100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/c50c50k100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'C50,M50,K100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/c50m50k100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'C50,C75,C100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/c50c75c100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'GR25,GR50,GR100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/gr25gr50gr100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'K100,C100,M100,Y100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/k100c100m100y100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'K100,C100,M100,Y100+K100,C100,M100,Y100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/k100c100m100y100+k100c100m100y100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'C100,M100,Y100,C50,M50'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/c100m100y100c50m50.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'K100,C100,M100,Y100,C50,M50'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/k100c100m100y100c50m50.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = '3xK'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/3xk.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = '3xC'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/3xc.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = '3xM'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/3xm.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = '3xY'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/3xy.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'K100,C100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/k100c100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'M100,Y100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/m100y100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'M100,C100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/m100c100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'Y100,K100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/y100k100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'K100 + C100,M100,Y100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/k100+c100m100y100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'C100 + M100 + Y100'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/c100m100y100.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'T1x'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/t1x.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'T2x'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/t2x.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'T3x'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/t3x.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'T4x'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/t4x.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'T5x'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/t5x.png" class="color_scheme"/></xsl:when>
				<xsl:when test="@color_code = 'T6x'"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/color_schemes/t6x.png" class="color_scheme"/></xsl:when>
				
				<xsl:otherwise>
					unknown color scheme!
				</xsl:otherwise>
			</xsl:choose>
			
		</span>
	</xsl:template>
	
	<xsl:template match="system">
		<xsl:copy-of select=" ./*" />
	</xsl:template>
	
	<xsl:template match="blocktitle">
		<div class="blocktitle">
		    <xsl:choose>
	            <xsl:when test="@bottom_space">
	                <xsl:attribute name="style">margin-bottom: <xsl:value-of select="round(@bottom_space*5)"/>px;</xsl:attribute>
	            </xsl:when>
            </xsl:choose>
			<xsl:apply-templates mode="blocktitle"/>
		</div>
	</xsl:template>
	<xsl:template match="maintitle" mode="blocktitle">
		<div><xsl:apply-templates/></div>
	</xsl:template>
	<xsl:template match="subtitle" mode="blocktitle">
		<div class="subtitle"><xsl:apply-templates/></div>
	</xsl:template>
	
	<xsl:template match="paraheadline">
		<div class="paraheadline"><xsl:apply-templates/></div>
	</xsl:template>
	
	<xsl:template match="ruler">
		<div class="ruler"><xsl:apply-templates/></div>
	</xsl:template>
	
	<xsl:template match="para">
		<p><xsl:apply-templates/></p>
	</xsl:template>

	<xsl:template match="caption">
		<span class="media-caption"><xsl:apply-templates/></span>
	</xsl:template>
	
	<xsl:template match="legend">
		<div class="legend"><xsl:apply-templates/></div>
	</xsl:template>
	
	<xsl:template match="emphasize">
		<i><xsl:apply-templates/></i>
	</xsl:template>
	
	<xsl:template match="bold">
		<b><xsl:apply-templates/></b>
	</xsl:template>
	
	<xsl:template match="subscript">
		<sub><xsl:apply-templates/></sub>
	</xsl:template>
	
	<xsl:template match="superscript">
		<sup><xsl:apply-templates/></sup>
	</xsl:template>
	
	<xsl:template match="nowrap">
		<span class="nowrap"><xsl:apply-templates/></span>
	</xsl:template>
	
	<xsl:template match="spacer">
		<xsl:choose>
			<xsl:when test="@display='line'">
				<div __bxe_id="{@__bxe_id}" class="spacer" style="clear: both;"><img src="/_rsc/gfx/spacer.gif" width="{round(@x-size * 5)}" height="{round(@y-size * 5)}"></img></div>
			</xsl:when>
			<xsl:when test="@display='visibleline'">
				<div __bxe_id="{@__bxe_id}" class="visibleline"><img src="/_rsc/gfx/spacer.gif" width="{round(@x-size * 5)}" height="{round(@y-size * 5)}"></img></div>
			</xsl:when>
			<xsl:otherwise>
				<img __bxe_id="{@__bxe_id}" class="spacer" src="/_rsc/gfx/spacer.gif" width="{round(@x-size * 5)}" height="{round(@y-size * 5)}"></img>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="linebreak">
		<!--<span style="color: red; border: 1px dotted red;"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/linebreak.png"></img></span><br></br>-->
		<span __bxe_id="{@__bxe_id}" class="linebreak"><br/></span>
	</xsl:template>
	
	<xsl:template match="linebreak_soft">
        <!--<span style="color: red; border: 1px dotted red;"><img src="/_rsc/_cope2/co_types/catalogpage_1/gfx/linebreak.png"></img></span><br></br>-->
        <span __bxe_id="{@__bxe_id}" class="linebreak_soft"><br/></span>
    </xsl:template>
	
	<xsl:template match="docnote">  <!-- are not rendered in view mode -->
		<span class="docnote"><xsl:value-of select="."/></span>
	</xsl:template>
	
	<xsl:template match="download">
		<a  class="download">
			<xsl:apply-templates/>
		</a>
	</xsl:template>

	<!-- featurelistS are deprecated -->
	<xsl:template match="featureslists">
		<table __bxe_id="{@__bxe_id}" cellpadding="0" cellspacing="0" style="width: 100%;">
			<tr>
				<xsl:variable name="width" select="100 div count(child::*)"/>
				<xsl:for-each select="featureslist | product_image">
					<xsl:variable name="border_style">
						<xsl:choose>
							<xsl:when test="not(position() = last())">
								border-right: 0px;
							</xsl:when>
							<xsl:otherwise>
								border-right: 0px;
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="name(.) = 'featureslist'">
							<td style="width: {$width}%; min-width: {$width}%; max-width: {$width}%; {$border_style} text-align: left; vertical-align: top; padding-right: 1em;"><xsl:call-template name="featureslist"/></td>
						</xsl:when>
						<xsl:otherwise>
							<td style="width: {$width}%; min-width: {$width}%; max-width: {$width}%; {$border_style} text-align: left; vertical-align: top; padding-right: 1em;"><xsl:apply-templates select="."/></td>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match="featureslist" name="featureslist">
		<ul __bxe_id="{@__bxe_id}" class="featureslist">
			<xsl:apply-templates/>
		</ul>
	</xsl:template>

	<!-- which of them, listitem or bxlistitem is no longer in use? -->
	<xsl:template match="listitem">
		<li><xsl:apply-templates/></li>
	</xsl:template>
	
	<xsl:template match="bxlistitem">
		<li><xsl:apply-templates/></li>
	</xsl:template>
	
	<!-- special page elements -->
	
	<xsl:template match="pagereferer">
		<div __bxe_id="{@__bxe_id}" class="pagereferer" style="">
		<xsl:choose>
			<xsl:when test="@all_countries = 'no'">
				<xsl:attribute name="class">pagereferer pagereferer_gray</xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
				<xsl:attribute name="class">pagereferer pagereferer_colored</xsl:attribute>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="$pagelayout = '3-rows'">
				<xsl:variable name="width" select="273 * @colspan - 20"/>
				<xsl:attribute name="style">width: <xsl:value-of select="$width"/>px; min-width: <xsl:value-of select="$width"/>px;	max-width: <xsl:value-of select="$width"/>px;</xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="width" select="204 * @colspan - 20"/>
				<xsl:attribute name="style">width: <xsl:value-of select="$width"/>px; min-width: <xsl:value-of select="$width"/>px;	max-width: <xsl:value-of select="$width"/>px;</xsl:attribute>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="@refer_to = 'webpage'">
				<div class="webpage">
					<span class="left"><xsl:value-of select="left"/></span>
					<span class="clearify"></span>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div class="catalogpage">
					<span class="left"><xsl:value-of select="left"/></span>
					<span class="right"><xsl:value-of select="right"/>&#160;<xsl:value-of select="page_number"/></span>
					<span class="clearify"></span>
				</div>
			</xsl:otherwise>
		</xsl:choose>
		</div>
	</xsl:template>
		
	<xsl:template match="infolabel">
        <div class="infolabel" style="">
        
        <xsl:choose>
            <xsl:when test="$pagelayout = '3-rows'">
                <xsl:variable name="width" select="273 * @colspan - 20"/>
                <xsl:attribute name="style">width: <xsl:value-of select="$width"/>px; min-width: <xsl:value-of select="$width"/>px; max-width: <xsl:value-of select="$width"/>px;</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="width" select="204 * @colspan - 20"/>
                <xsl:attribute name="style">width: <xsl:value-of select="$width"/>px; min-width: <xsl:value-of select="$width"/>px; max-width: <xsl:value-of select="$width"/>px;</xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
             <xsl:when test="@all_countries = 'no'">
                 <xsl:choose>
                     <xsl:when test="@variant = 'pageheader'">
                         <xsl:attribute name="class">infolabel ilph</xsl:attribute>
                         <div __bxe_id="{@__bxe_id}" class="pageheader"><xsl:apply-templates/></div>
                     </xsl:when>
                     <xsl:when test="@variant = 'new'">
                         <xsl:attribute name="class">infolabel infolabel_gray</xsl:attribute>
                         <xsl:attribute name="style">width: 185px;</xsl:attribute>
                         <div __bxe_id="{@__bxe_id}" class="new_gray"><xsl:apply-templates/></div>
                     </xsl:when>
                     <xsl:otherwise>
                         <xsl:attribute name="class">infolabel infolabel_gray</xsl:attribute>
                         <div __bxe_id="{@__bxe_id}" class="infolabel_bg_gray"><xsl:apply-templates/></div>
                     </xsl:otherwise>
                 </xsl:choose>
             </xsl:when>
             <xsl:otherwise>
                 <xsl:choose>
                     <xsl:when test="@variant = 'pageheader'">
                         <xsl:attribute name="class">infolabel ilph</xsl:attribute>
                         <div __bxe_id="{@__bxe_id}" class="pageheader"><xsl:apply-templates/></div>
                     </xsl:when>
                     <xsl:when test="@variant = 'new'">
                         <xsl:attribute name="class">infolabel infolabel_colored</xsl:attribute>
                         <xsl:attribute name="style">width: 185px;</xsl:attribute>
                         <div __bxe_id="{@__bxe_id}" class="new_colored"><xsl:apply-templates/></div>
                     </xsl:when>
                     <xsl:otherwise>
                         <xsl:attribute name="class">infolabel infolabel_colored</xsl:attribute>
                         <div __bxe_id="{@__bxe_id}" class="infolabel_bg_colored"><xsl:apply-templates/></div>
                     </xsl:otherwise>
                 </xsl:choose>
             </xsl:otherwise>
         </xsl:choose>
        </div>
    </xsl:template>


	<xsl:template match="infobox">
		<table __bxe_id="{@__bxe_id}" class="infobox" cellpadding="0" cellspacing="0">
			<xsl:if test="/document/header/@show_de_control_layer = 'yes'">
				<xsl:attribute name="style">background-color: transparent</xsl:attribute>
			</xsl:if>
			<tr>
				<xsl:for-each select="textblock | imageblock">
					<xsl:choose>
						<xsl:when test="name(.) = 'textblock'">
							<td class="textblock"><xsl:apply-templates/></td>
						</xsl:when>
						<xsl:otherwise>
							<td class="imageblock" style="vertical-align: {@valign}; text-align: {@align};"><xsl:apply-templates/></td>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</tr>
		</table>	
	</xsl:template>
	
	<xsl:template match="layer">
		<div __bxe_id="{@__bxe_id}" style="background: transparent url(/_rsc/_cope2/co_types/catalogpage_1/gfx/background_layer.png);">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	
	<!-- END OF special page elements -->
	
	<!-- image types -->
	
    <xsl:template match="media">
        <div __bxe_id="{@__bxe_id}" class="media">
			<xsl:choose>
				<xsl:when test="@floating = 'left'">
					<xsl:attribute name="style">float: left; margin: 0 1em 0 0; text-align: <xsl:value-of select="@align"/>;</xsl:attribute>
				</xsl:when>
				<xsl:when test="@floating = 'right'">
					<xsl:attribute name="style">float: right; margin: 0 0 0 1em; text-align: <xsl:value-of select="@align"/>;</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="style">float: none; text-align: <xsl:value-of select="@align"/>;</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<img class="media">
				<xsl:attribute name="src"><xsl:value-of select="@url"/>/self.web?mode=view&amp;x-size=<xsl:value-of select="round(@x-size * 5)"/>&amp;y-size=<xsl:value-of select="round(@y-size * 5)"/>&amp;xy-size=<xsl:value-of select="round(@xy-size * 25)"/>&amp;format=<xsl:value-of select="@format"/>&amp;colormode=RGBA</xsl:attribute>
			</img>
			<br/>
			<xsl:apply-templates select="caption"/>
		</div>
  	</xsl:template>
    
	<xsl:template match="product_images">
		<xsl:choose>
			<xsl:when test="@layout = 'horizontal'">
				<div style="text-align: center;">
					<table __bxe_id="{@__bxe_id}" width="{@width}">
						<tr>
							<xsl:for-each select="product_image | media | logo | spacer | infolabel | multilingual_image">
								<td style="vertical-align: {../@valign}; text-align: center;"><xsl:apply-templates select="."/></td>
							</xsl:for-each>						
						</tr>
					</table>
                    <xsl:apply-templates select="caption"/>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div style="text-align: center;">
					<table __bxe_id="{@__bxe_id}" width="100%">
						<xsl:for-each select="product_image | media | logo | spacer | infolabel | multilingual_image">
							<tr>
								<td style="vertical-align: {../@valign}; text-align: {../@align};"><xsl:apply-templates select="."/></td>
							</tr>
						</xsl:for-each>												
					</table>
                    <xsl:apply-templates select="caption"/>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="product_image" name="product_image">
		<div __bxe_id="{@__bxe_id}" class="product_image" style="">
			<xsl:choose>
				<xsl:when test="@floating = 'left'">
					<xsl:attribute name="style">float: left; margin: 0 1em 0 0; text-align: <xsl:value-of select="@align"/>;</xsl:attribute>
				</xsl:when>
				<xsl:when test="@floating = 'right'">
					<xsl:attribute name="style">float: right; margin: 0 0 0 1em; text-align: <xsl:value-of select="@align"/>;</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="style">float: none; text-align: <xsl:value-of select="@align"/>;</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<img class="media">
				<xsl:variable name="seq_no">
					<xsl:choose>
						<xsl:when test="@sequence_number"><xsl:value-of select="@sequence_number"/></xsl:when>
						<xsl:otherwise>1</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:attribute name="src">/product_image.png/<xsl:value-of select="$seq_no"/>?oid=<xsl:value-of select="@object_id"/>&amp;pid=<xsl:value-of select="@product_id"/>&amp;keywords=<xsl:value-of select="normalize-space(@keywords)"/>&amp;x-size=<xsl:value-of select="round(@x-size * 5)"/>&amp;y-size=<xsl:value-of select="round(@y-size * 5)"/>&amp;xy-size=<xsl:value-of select="round(@xy-size * 25)"/>&amp;colormode=RGBA&amp;poorqualityscale=0.42&amp;request_mode=view</xsl:attribute>
			</img>
			<br/>
			<xsl:apply-templates select="caption"/>
		</div>
	</xsl:template>

	<xsl:template match="logo">
	    <xsl:variable name="_sap_code">
            <xsl:call-template name="replace-string">
                <xsl:with-param name="text" select="@manufacturer_id"/>
                <xsl:with-param name="from" select="'+'"/>
                <xsl:with-param name="to" select="'%2B'"/>
            </xsl:call-template>
        </xsl:variable>
		<span __bxe_id="{@__bxe_id}" >
			<xsl:choose>
				<xsl:when test="@floating = 'left'">
					<xsl:attribute name="style">float: left; margin: 0 1em 0.5em 0;</xsl:attribute>
				</xsl:when>
				<xsl:when test="@floating = 'right'">
					<xsl:attribute name="style">float: right; margin: 0 0 0.5em 1em;</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="style">float: none;</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<img class="media">
				<xsl:attribute name="src">/manufacturer_logo.png?&amp;id=<xsl:value-of select="$_sap_code"/>&amp;mode=view&amp;x-size=<xsl:value-of select="round(@x-size * 5)"/>&amp;y-size=<xsl:value-of select="round(@y-size * 5)"/>&amp;xy-size=<xsl:value-of select="round(@xy-size * 25)"/>&amp;colormode=RGBA&amp;poorqualityscale=0.42</xsl:attribute>
			</img>
		</span>
	</xsl:template>
	
	<xsl:template match="multilingual_image" name="multilingual_image">
        <div __bxe_id="{@__bxe_id}" class="product_image" style="">
            <xsl:choose>
                <xsl:when test="@floating = 'left'">
                    <xsl:attribute name="style">float: left; margin: 0 1em 0 0; text-align: <xsl:value-of select="@align"/>;</xsl:attribute>
                </xsl:when>
                <xsl:when test="@floating = 'right'">
                    <xsl:attribute name="style">float: right; margin: 0 0 0 1em; text-align: <xsl:value-of select="@align"/>;</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="style">float: none; text-align: <xsl:value-of select="@align"/>;</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <img class="media">
                <xsl:attribute name="src">/multilingualimage.png?objectid=<xsl:value-of select="@objectid"/>&amp;name=<xsl:value-of select="@name"/>&amp;language=<xsl:value-of select="$language"/>&amp;x-size=<xsl:value-of select="round(@x-size * 5)"/>&amp;y-size=<xsl:value-of select="round(@y-size * 5)"/>&amp;xy-size=<xsl:value-of select="round(@xy-size * 25)"/>&amp;colormode=RGBA&amp;poorqualityscale=0.42&amp;request_mode=view</xsl:attribute>
            </img>
            <br/>
            <xsl:apply-templates select="caption"/>
        </div>
    </xsl:template>
    
    <xsl:template name="replace-string">
        <xsl:param name="text"/>
        <xsl:param name="from"/>
        <xsl:param name="to"/>

        <xsl:choose>
            <xsl:when test="contains($text, $from)">
     
                <xsl:variable name="before" select="substring-before($text, $from)"/>
                <xsl:variable name="after" select="substring-after($text, $from)"/>
                <xsl:variable name="prefix" select="concat($before, $to)"/>
    
                <xsl:value-of select="$before"/>
                <xsl:value-of select="$to"/>
                <xsl:call-template name="replace-string">
                    <xsl:with-param name="text" select="$after"/>
                    <xsl:with-param name="from" select="$from"/>
                    <xsl:with-param name="to" select="$to"/>
                </xsl:call-template>
            </xsl:when> 
            <xsl:otherwise>
                <xsl:value-of select="$text"/>  
            </xsl:otherwise>
        </xsl:choose>            
    </xsl:template>
    
	<!-- END OF image types -->

	<xsl:template match="*"></xsl:template>

</xsl:stylesheet>
