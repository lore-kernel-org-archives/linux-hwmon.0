Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85755C433FE
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 Oct 2022 10:31:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbiJ2Kbg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Oct 2022 06:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiJ2Kbf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Oct 2022 06:31:35 -0400
Received: from ipmail03.adl6.internode.on.net (ipmail03.adl6.internode.on.net [150.101.137.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9B4026FA2E
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Oct 2022 03:31:28 -0700 (PDT)
IronPort-SDR: ECkGNbbYt4RNxim9VPLfh/LLdIi85eUi9ORcRMN2P6VxaxfAKfKzzEj1AooozkM5Rnb9nYXnYo
 lHm4NHZGOiHt6t9b3lzOH0RwP19F3FWcdN0wI/+C7yaxSP8ROdZ512KoQJxfgg/jmPBZQ4gopU
 oLyDwHPhwqurjX0ky3xrfvZBFff7bV4g+o6mN7FH+3HlD8Zz8Bu1B6CZfCt8FGUF/hw1QI+emt
 zfzxuXMnbkZZW73oWESDHUSBZ1M+JENKpghyvL2KsMx6qnC8S8dZUqZqVZGmko8V681yDytI/X
 GZNlxw89lco/AOwyzpw9y75z
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2AADABmAF1j//Qc8jxaHgEBCxIMSYE7C4ItglmVaJ0kg?=
 =?us-ascii?q?X0PAQ8BAUQEAQGFBYR8JjYHDgECBAEBAQEDAgMBAQEBAQEDAQEGAQEBAQEBB?=
 =?us-ascii?q?gRvATkHC1IHC1gHB4FBC4FhEwsDMQ2GRSsLAQ0BATcBKIEVARKCfYMhrhMzg?=
 =?us-ascii?q?QGCCAEBBoJggy6BXQmBPYsvgRCDNoE9P4FOgRWCem6EJoZblmcDCQMHBUlAA?=
 =?us-ascii?q?wsYDRYyAwoTOhtYDgkfHCUNBQYSAyBuBQc6DygvZxAbHBsHgQwqKBUDBAQDA?=
 =?us-ascii?q?gYTAyACDSkxFAQpEw0rByNxCQIDImoDAwQoLAMJQAcnJjwHWDoFAwIQIjwGA?=
 =?us-ascii?q?wkDAiJYdTASFAUDDRclCAVPBAg6AgUGUhICChEDEg8sRw5KPjkWBidEATQPD?=
 =?us-ascii?q?hYDYlEemWgBawYBLRAcNYIxQ5JbOo4LoSyDcIFMnmhMgUSnT5crIKFsgRiEK?=
 =?us-ascii?q?AIKBxaBaQ2CAU0fGYMiTwECAQEBDQECAQEDAQIBAQEJAQEBAY4dDBYVgXWMO?=
 =?us-ascii?q?GE7AgcLAQEDCYo+AQE?=
IronPort-PHdr: A9a23:MUUXbhCLUlexCFG75ZUMUyQVWBdPi9zP1kY94Js7kPRFaK288ZP4M
 ArS4OgrjVOPVJiIo/tegL/QtKbtEXcF/Y7Hqn0Hd4BBEh4d3Msak1ZyX8eMBR/3cKG6PXVoT
 s9IDQc39HrjbiBo
IronPort-Data: A9a23:wAHwva2EpuDs0x8+3/bD5eR3kn2cJEfYwER7XKvMYLTBsI5bpzZWz
 TAbWGuCPf+KYzCgeY9/a9m1oE1X7ZGAndRlG1E4rnxjRSwT9cbMXt6ScUytbiiccZTIR0lps
 JRDO4bOIJAdQy6HrH9BEJC4/SEmj/3gqpkQqQLgEnosLeOxYH550XqPo8Zg3sgwx4LR7zql4
 bsemeWGULOY82cc3lw8u/rrRCxH5JweiBtA1rDpTa0jUPf2zhH5PbpHTU2DByKQrrp8QoZWc
 93+IISRpQs1yfuM5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2Pc0MS9qZzu1c99Z8
 sVJu8OyRDgQb5aLnf0xYyJ+MHp3MvgTkFPHCSDXXc27xUzaaD3n2fxxAkYsMcsV//sxAG0I/
 OFwxDIlMEjF3b7shujrDLMw2qzPL+GyVG8bkn96xDfaJf08SI/NRL/Go9JdwXExioZHAJ4yY
 uJDOGAxN0WYP0Qn1lE/WLNjg+iJwUvGeSRSrXnMmZY6yVTs01kkuFTqGIGNIYzQH5Q9clyjj
 mbH+XnpRxEFMduZ4SSK/2jqheLVmy7/HoUIG9WQ8v9snU273GseAx5TSED9p/Sl4ma8V99bN
 UUO9wI1sLM/skesS7HAswaQ/ibB5EJGHoAAVrdmtEeW1qPI4g3fGnALT3hKb9lgvdJeqSEWO
 kGhpcPtC2NtvYKsGEna8664nQiUGnMcIjpXDcMbdjct797mqYA1qxvASNd/DaK45uEZ/xmun
 lhmSwBg2d0uYd43O7aTuAuc0231+vAlWiZsu1yNBjr7hu9sTNT9D7FE/2Q3+t5pEe51pHG6r
 XQCltn2AAsmV8nVzERhrM0rEa7h3PGYLD2UvldrEoJJythA0yD7ONoMunQkdAIzbppCYiPgf
 E7Y/x9J654VN3yvK6ZqC25QNyjI5fOwfTgGfqqPBjarXnSXXFXflM2JTRfBt10BaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNG86qn033iuLGPSH9pVI53L2mML5RAESs/lu9z
 jqjH5HTo/mieLegM3aMq957wa4icyFlW8meRzNrmh6reVI9SDt7Wpc9MJs9Y4MtnqJJm/3O8
 23VZ6Or4ASXuJEzEi3UMC8LVV8Zdcsn9SpT0O1FFQ3A5kXPlq71tvhBKsNmJuV8nAGhpNYtJ
 8Q4lwy7KqwnYlz6F/41NPERdaRuK0amgxygJS2gbGRtdpJsXVWZqNT+dxTh8zMCSCeyqI0/r
 /upy1qDE5YEQg1jCufQae6ulg3v4SRBx74iBEaYcMNOfEjM8ZRxL3KjhPEAI/YKdUfJyAyFh
 lSfDhovrOXQp5M4rYvSjqeeoob3T+ZzRxIIH2TS4busGzPd+26vnd1JXOqSJGCPX3n956ulf
 +kTwvThdvwL2l9X6tIuH7FuxKM4xt3uu74DkFo4QCmUMwTwB+o5cHec3MRJuqlc/ZNjuFO7C
 hCV591XGbSVI8e7QlQfEwoSaLjR3/8jhWiA5Ps4F0z2+Str8efVSk5VJRSN1nBQIbYpYoMox
 eAt5Jwf5wCl0EF4ONealWZf7W2TIHsaX+Mqs4xcAYOtgxdykgNOZpnVCynX5pCTaowSbBV2f
 mDI1PHP1+ZG207PU3svDnyTj+BTspQ5vkwYxlE1OAXbk9XIsfY7wRlN/GllVQ9S1BhGjb5+N
 zQ5LUFzPqnSrT5kiNIYBTLyQ0QbWEfcoBy0kQdV0nbFRlWpXSrRNGI8f+2K+QYQ7jsELDRc+
 biZzkfjUCrrJZ+vgnduBhI18PGzH8Zs8gDimdy8G5jXFZcNZ2u3i6CjUmMEth/7DJ5jn0bAv
 +Rrorp9ZKCT2fT8eEHn51R2DYgtdS0=
IronPort-HdrOrdr: A9a23:hx9326NYruxmVMBcTu+jsMiBIKoaSvp037BK7SpMoNJuE/Bw8P
 re+8jyt3fP5Qr5PUtNpTnuAtjifZqxz/FICOoqTNOftXfdyQmVxehZhOOI/9SKIU3DH4Bmu5
 uJ/MVFebvN5CBB/KPHCRGDYqwdKce8gduVbDjlvg5QpdADUdAZ0ztE
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl6.internode.on.net with ESMTP; 29 Oct 2022 21:01:23 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 29TAV25w1738314
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 29 Oct 2022 21:31:12 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 29TAV25w1738314
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1667039472; bh=uqk/JFFjsWGipySvgWqY+xeZqFcSjY1L7V5klbQ4L/o=;
        h=From:To:Cc:Subject:Date:From;
        b=rFJfbUuHXWvphT36u+GJoYoPVPU+h+almO13TU1ao+WFCmIOqDj5QjgpZW/Ih+kQ2
         uaM44NG9f8IjEPqnWUwYg7BjJLlYYT/Fd6WyMGTQ7yZQqYc7Nh1xB/7sLhAmaL7JHv
         Bzcee/d1lf0rTUczh7hboTE/A21QiSGT9rBebAvcFA7imu7Af8FFiFPwozSol/ba27
         L83eTlZDzvwnNzq3XuV+QjQlms3YyYqznSX0/9K8pq08r2n0nf1NGdCe36qGXOT7bI
         NuwrBghtA+DG4C0etj6hfYnDw5C8idHblf2xHQOVkCADarnT6754flophItkYhPhzH
         iC08ZbZz2gzGw==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 1/1] hwmon: (it87) Create DMI matching table for various board settings
Date:   Sat, 29 Oct 2022 21:30:57 +1100
Message-Id: <20221029103057.3234561-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 29 Oct 2022 21:31:12 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Changes in this patch set:

* Define the DMI matching table for board specific settings during the
  chip initialisation and move the only current board specific setting
  to this new table.

* Export the table for use by udev.

v2: updates following comments:

* Converted to use callback function.

* Moved call to callback funtion to sio_data into it87_find in line
  with other settings for sio_data.  This requires dmi_data also passed
  to access additional data.

* Added macro for defining entries in DMI table to simplify future 
  additions.

* Note dmi_data is defined in sm_it87_init to simplify tests and for
  future additions.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 79 ++++++++++++++++++++++++++++++++------------
 1 file changed, 58 insertions(+), 21 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 73ed21ab325b..4314bbca2c22 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -567,6 +567,14 @@ struct it87_data {
 	s8 auto_temp[NUM_AUTO_PWM][5];	/* [nr][0] is point1_temp_hyst */
 };
 
+/* Board specific settings from DMI matching */
+struct it87_dmi_data {
+	u8 skip_pwm;		/* pwm channels to skip for this board  */
+	/* Callback for option setting */
+	void (*apply_cb)(struct it87_sio_data *sio_data,
+			 struct it87_dmi_data *dmi_data);
+};
+
 static int adc_lsb(const struct it87_data *data, int nr)
 {
 	int lsb;
@@ -2389,11 +2397,11 @@ static const struct attribute_group it87_group_auto_pwm = {
 
 /* SuperIO detection - will change isa_address if a chip is found */
 static int __init it87_find(int sioaddr, unsigned short *address,
-			    struct it87_sio_data *sio_data)
+			    struct it87_sio_data *sio_data,
+			    struct it87_dmi_data *dmi_data)
 {
 	int err;
 	u16 chip_type;
-	const char *board_vendor, *board_name;
 	const struct it87_devices *config;
 
 	err = superio_enter(sioaddr);
@@ -2812,24 +2820,9 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	if (sio_data->beep_pin)
 		pr_info("Beeping is supported\n");
 
-	/* Disable specific features based on DMI strings */
-	board_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
-	board_name = dmi_get_system_info(DMI_BOARD_NAME);
-	if (board_vendor && board_name) {
-		if (strcmp(board_vendor, "nVIDIA") == 0 &&
-		    strcmp(board_name, "FN68PT") == 0) {
-			/*
-			 * On the Shuttle SN68PT, FAN_CTL2 is apparently not
-			 * connected to a fan, but to something else. One user
-			 * has reported instant system power-off when changing
-			 * the PWM2 duty cycle, so we disable it.
-			 * I use the board name string as the trigger in case
-			 * the same board is ever used in other systems.
-			 */
-			pr_info("Disabling pwm2 due to hardware constraints\n");
-			sio_data->skip_pwm = BIT(1);
-		}
-	}
+	/* Set values based on DMI matches */
+	if (dmi_data && dmi_data->apply_cb)
+		dmi_data->apply_cb(sio_data, dmi_data);
 
 exit:
 	superio_exit(sioaddr);
@@ -3307,14 +3300,57 @@ static int __init it87_device_add(int index, unsigned short address,
 	return err;
 }
 
+static void it87_dmi_cb_apply_data(struct it87_sio_data *sio_data,
+				   struct it87_dmi_data *dmi_data)
+{
+	if (dmi_data->skip_pwm) {
+		pr_info("Disabling pwm2 due to hardware constraints\n");
+		sio_data->skip_pwm |= dmi_data->skip_pwm;
+	}
+}
+
+/*
+ * On the Shuttle SN68PT, FAN_CTL2 is apparently not
+ * connected to a fan, but to something else. One user
+ * has reported instant system power-off when changing
+ * the PWM2 duty cycle, so we disable it.
+ * I use the board name string as the trigger in case
+ * the same board is ever used in other systems.
+ */
+static struct it87_dmi_data nvidia_fn68pt = {
+	.skip_pwm = BIT(1),
+	.apply_cb = it87_dmi_cb_apply_data,
+};
+
+#define IT87_DMI_MATCH_VND(vendor, name, data) \
+	{ \
+		.matches = { \
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, vendor), \
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, name), \
+		}, \
+		.driver_data = data, \
+	}
+
+static const struct dmi_system_id it87_dmi_table[] __initconst = {
+	IT87_DMI_MATCH_VND("nVIDIA", "FN68PT", &nvidia_fn68pt),
+	{ }
+
+};
+MODULE_DEVICE_TABLE(dmi, it87_dmi_table);
+
 static int __init sm_it87_init(void)
 {
+	const struct dmi_system_id *dmi = dmi_first_match(it87_dmi_table);
+	struct it87_dmi_data *dmi_data = NULL;
 	int sioaddr[2] = { REG_2E, REG_4E };
 	struct it87_sio_data sio_data;
 	unsigned short isa_address[2];
 	bool found = false;
 	int i, err;
 
+	if (dmi)
+		dmi_data = dmi->driver_data;
+
 	err = platform_driver_register(&it87_driver);
 	if (err)
 		return err;
@@ -3322,7 +3358,8 @@ static int __init sm_it87_init(void)
 	for (i = 0; i < ARRAY_SIZE(sioaddr); i++) {
 		memset(&sio_data, 0, sizeof(struct it87_sio_data));
 		isa_address[i] = 0;
-		err = it87_find(sioaddr[i], &isa_address[i], &sio_data);
+		err = it87_find(sioaddr[i], &isa_address[i], &sio_data,
+				dmi_data);
 		if (err || isa_address[i] == 0)
 			continue;
 		/*
-- 
2.37.3

