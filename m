Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5323C4332F
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Nov 2022 04:59:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiKEE7G (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Nov 2022 00:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbiKEE6t (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Nov 2022 00:58:49 -0400
Received: from ipmail03.adl2.internode.on.net (ipmail03.adl2.internode.on.net [150.101.137.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B5299311
        for <linux-hwmon@vger.kernel.org>; Fri,  4 Nov 2022 21:58:25 -0700 (PDT)
IronPort-SDR: iQMq4EQ5v5seZh3ZddiIm+2iudHpTzITLr37kmoPsdIntikDt9vKBEOaWkWVP4EjOqZLkZr1bd
 v2K6ZVz65GfXqrR76nlJgWvOtoMEd+6oCTjXA6ona/GTPMwnToVfMdJw2HxL4uY9Yt/9Uyi7Dc
 4JTINKP4hcWzZ8ra84rHDCQBXtl9etE7B25jImenjvNJKpnTTliagdhlAPiuMn7QqHQ9pLgVv4
 UoT/zCX1OioqUhq6c+CqzagMV4w3hEteb8ei4i20a78r0Oxi2OYlZyq50hppjI82MVdU2MEPC1
 azfra+uwTjYLQ4fUE0OfUfqz
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2DjDADA62Vj//Qc8jxaHgEBCxIMSYE7C4ItglqVaJ8pD?=
 =?us-ascii?q?wEPAQFEBAEBhQWEeyY3Bg4BAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQYEb?=
 =?us-ascii?q?wE5BwtSBwtYBweBQQuBYRMLAzENhkUrCwENAQE3ASiBFQESgn2DIqxjM4EBg?=
 =?us-ascii?q?ggBAQaCYJZygV4JgUABi0CBEoM2gT0/gU6ED26EJoZcl0QDCQMHBUlAAwsYD?=
 =?us-ascii?q?RYyAwoTOBtYDgkfHCUNBQYSAyBuBQc6DygvZyscGweBDCooFQMEBAMCBhMDI?=
 =?us-ascii?q?gINKTEUBCkTDSsHI3EJAgMiagMDBCgsAwlAByckPAdXOgUDAhAiOgYDCQMCJ?=
 =?us-ascii?q?Fh1MBIUBQMNFyUIBU4ECDoCBQZSEgIKEQMSDyxHDko+ORYGJ0QBNA8OFANeT?=
 =?us-ascii?q?B6BAwabDQFrBz0cNYIwAUOSWzqODaEzg3GBTJ5qTIFEgjSlHZcwIIIrn0OBG?=
 =?us-ascii?q?IQoAgoHFoF4gX9NHxmDIk8BAgEBAQ0BAgEBAwECAQEBCQEBAQGOHQwWggqMO?=
 =?us-ascii?q?GE7AgcLAQEDCYp9AQE?=
IronPort-PHdr: A9a23:GJagwBxerriaAp3XCzPpngc9DxPP853+PxIOrJE9gq1Adb6vuZnnI
 Qre6bNkkQyBVJ/QvvRDjeeeqKX8QSoa7JOGrH1HcYQZWRMJ05dJlgUsUsLZVh2pday4ZCZjR
 JZJXwc6l0w=
IronPort-Data: A9a23:TfAhIKr7eFaSUxVAgzWbS773GJ1eBmIxYxIvgKrLsJaIsI4StFCzt
 garIBnXbPaOMGagc9EiPtuwoUgHupXRm9M1QAc//yAzFntHpJqYCNnDIh78b3vKdMHORxNrt
 JtDY4PNfJo/FSHXr071G7Ww9nMUOYOgH+qkUrSYUsxSqa6IbA971HqPTsZg2tYAbeCRWl/L4
 ZWoyyHmEAfNNwRcawr41orawP9RlKSq0N8nlgRWicBj5DcyQFFIZH63DfjZw0rQGuG4LMbjL
 wrw5O3RElfiwvsYIojNfoAX06E9auW60QCm0hK6UkU56/RIjnRaPq0TbJLwZarL4tmEt4gZ9
 TlDiXC/YT0yZIz8te9AbwtjDChUJa5q0Y7NG0Hq5KR/z2WeG5ft6/9vEFpwNpcR5ehwG20I+
 PkFbjEBKBme7w606OzjDLMw3IJ5fI+xYN93VnJIlFk1Cd4oW5nFQI3B/9ZH0jAqioZDGOuYZ
 sZfYCcHgBHoOU0UYgtKVcNn9Auurmvvf2JhmWCUnvAIuFDx4VVUwL7Rd+OAL7RmQu0Oxh3I/
 DiXl4jjOTkeNdqC2X+F7XergMfRki7hHoEfDru18rhtmlL77mgSDgAGfUG8rPK6z1OlHdRSN
 yQ8+CYjqbY77kGDVcTmUluzp3vsg/IHc4QIVrdmskTXmu+Ov1rfHXQNUj9KLsA+u85wTjsvk
 FaU9z/0OdBxmIeOE1Ot27zJkSGJJiE/NWwuTB4OdzJQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2QM4W2eh7YSkjifvTwLzXv96/jt2SFV5qv1m/snaNt14gPtb9OeRE/HCCtZ59wJClok6pl
 UVsdyK21/ECC5yc/MBmaL9VROnBCxqtFjDDyWVoAoUhvwuk/3O4Fb28DRkgfAIzbpxBI2+sO
 hOP/xhN7YNSNz22daB2JYm2DoIj0MAM9OgJtNiPP7KigbArL2drGR2CgmbKhwjQfLAEy/1XB
 HtiWZ/E4YwmIapm1iGqYOwWzKUmwCszrUuKG86kkkT5j+HFPy7LIVvgDLdoRr5khE9jiFuLm
 +uzy+PQkX2zrcWkPHiIrNFNRbz0BSZkXs6qwyCoSgJzClE+QzF7Ua65LUIJZ5Rq16VTiurS+
 HyhMnK0O3Kh7UAr3T6iNCo8AI4Dq74i9SpjVcHtVH7zs0UejXGHtvpOJspoLed2qoSOD5dcF
 pE4RilJOdwXIhyvxtjXRcCVQFVKeEv5iASQETCiZTRjLZdsSxaQqo3vZALw+i4UAmy6sNZ4o
 rHm3x6CGcgPQAFrDcD3bvOzzgrv4yVFw7goDxrFcotJZUHh0Il2MCiv3PU5FME7L0mRzDWty
 FfECBgVkuDBvosp/YSbnquDtYqoTbdzExMCTWnW5Lq7LwfA+W+nzdMSWeqEZ2mNBmju8bqsY
 v9Zifz5LbsGkBBDrtMkQbpsyKs/4frppqNbl1o6QS2QNQ77W745eyuIx8hCsKFJ14R1gwruV
 xLd4MReNJWIJNjhTgwbKj0lWeLfh/sarSaDv/06LXLz6DJz4LfaA15ZOAOBiXIBIbZ4bNElz
 OMmtJJE4gCzkEBxYNyHkjsS/H6FMXIHSalhu5QHRo7nzAM2kwkQbZvZAy7wwZeOd9QVbBd3e
 mTO3vqTiuQO3FfGfloyCWPJg7hXi6MOjxYWnlUMEEvYyNPKi8g+0ABV7TlqHB9eyQ9K0rwvN
 2U3ZVd5I76Co2VhiMRZBDr+RVkEXkHDvxahjgFVyCvCU0C0V2eLMHUyOKCG+0Vf+n8FJmpX+
 7SRyWDEVzf2fZivgHZqAhQ/+63uHY5r6wnPuMG7BMDZTZM0Vjy00KahaF0BpwbjHc5s1lbMo
 vNn/bgsZKD2XcLKT3bX12VHOWwsdS25
IronPort-HdrOrdr: A9a23:tqvlB65yY0FPs9XvfwPXwObXdLJyesId70hD6qkQc3ZomwKj9v
 xG+85rsiMd6l4qNU3I/OrtBEDuewK+yXcY2+Ys1NSZLW3bURWTXeNfBOLZqlWKJ8SUzI5gPM
 lbHZSXh7DLfD5HZL7BkWyF+s4bsaO6Gb6T9JzjJqhWPHhXg3AJ1XYANjqm
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl2.internode.on.net with ESMTP; 05 Nov 2022 15:28:10 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 2A54vv7a2655766
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 5 Nov 2022 15:58:03 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 2A54vv7a2655766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1667624283; bh=O5I/l6HhGKpVtBP5RZcNFlxdukCKrt4vYh68G2abvEc=;
        h=From:To:Cc:Subject:Date:From;
        b=HoRkUdTgkM3MQRJBVyVpVz5BMWGiAaoP8ZlO5CO0j2JZodww8YM6S1y1i38aUG8LN
         4ZIMbkpdBwyztoTVizzjtIh+TkpZyo08ZGyMQpFtLRBIJlRP5QfJukUPh32IDWjNAS
         vso9O8pibMzjLKZnWR6o34T3X6BFsusQo+j3cdw/90/qgrrFFpOpa8YLhTKpI0740P
         OBQI0mcZD7QPsb1i4IsqFDWZNvpM9XqDHMNtl1Fe6XuQGn60WtQW/oksKjg10ggB+C
         eWgCSV57OKq/KvIxwDj44gl6QbVFmg0PQIBzhVl5HmtHXm8QS+3ryQwEljMUqL2w+a
         Avy2tOlTU2QDg==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v4 1/1] hwmon: (it87) Add DMI table for future extensions
Date:   Sat,  5 Nov 2022 15:57:54 +1100
Message-Id: <20221105045754.1439809-1-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 05 Nov 2022 15:58:03 +1100 (AEDT)
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

v3: further updates following comments:

* Proper use of callback functions for DMI functions.  This also
  involves saving dmi_data in a static variable for use as required.

* Moved to dmi_check_system() for testing DMI table.

v4: further cleanups following comments

* Note the macro IT87_DMI_MATCH_VND includes callback argument for use
  by a future update.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 72 ++++++++++++++++++++++++++++++++------------
 1 file changed, 53 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 73ed21ab325b..9997f76b1f4a 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -567,6 +567,14 @@ struct it87_data {
 	s8 auto_temp[NUM_AUTO_PWM][5];	/* [nr][0] is point1_temp_hyst */
 };
 
+/* Board specific settings from DMI matching */
+struct it87_dmi_data {
+	u8 skip_pwm;		/* pwm channels to skip for this board  */
+};
+
+/* Global for results from DMI matching, if needed */
+static struct it87_dmi_data *dmi_data;
+
 static int adc_lsb(const struct it87_data *data, int nr)
 {
 	int lsb;
@@ -2393,7 +2401,6 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 {
 	int err;
 	u16 chip_type;
-	const char *board_vendor, *board_name;
 	const struct it87_devices *config;
 
 	err = superio_enter(sioaddr);
@@ -2812,24 +2819,9 @@ static int __init it87_find(int sioaddr, unsigned short *address,
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
+	if (dmi_data)
+		sio_data->skip_pwm |= dmi_data->skip_pwm;
 
 exit:
 	superio_exit(sioaddr);
@@ -3307,6 +3299,46 @@ static int __init it87_device_add(int index, unsigned short address,
 	return err;
 }
 
+/* callback function for DMI */
+static int it87_dmi_cb(const struct dmi_system_id *dmi_entry)
+{
+	dmi_data = dmi_entry->driver_data;
+
+	if (dmi_data && dmi_data->skip_pwm)
+		pr_info("Disabling pwm2 due to hardware constraints\n");
+
+	return 1;
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
+};
+
+#define IT87_DMI_MATCH_VND(vendor, name, cb, data) \
+	{ \
+		.callback = cb, \
+		.matches = { \
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, vendor), \
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, name), \
+		}, \
+		.driver_data = data, \
+	}
+
+static const struct dmi_system_id it87_dmi_table[] __initconst = {
+	IT87_DMI_MATCH_VND("nVIDIA", "FN68PT", it87_dmi_cb, &nvidia_fn68pt),
+	{ }
+
+};
+MODULE_DEVICE_TABLE(dmi, it87_dmi_table);
+
 static int __init sm_it87_init(void)
 {
 	int sioaddr[2] = { REG_2E, REG_4E };
@@ -3319,6 +3351,8 @@ static int __init sm_it87_init(void)
 	if (err)
 		return err;
 
+	dmi_check_system(it87_dmi_table);
+
 	for (i = 0; i < ARRAY_SIZE(sioaddr); i++) {
 		memset(&sio_data, 0, sizeof(struct it87_sio_data));
 		isa_address[i] = 0;
-- 
2.38.1

