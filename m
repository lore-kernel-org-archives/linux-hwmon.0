Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659970;
	b=vEteYHieHJU3/PL/iOZ5kaku7RbucpyYjLvW/YvXMbCqatHyeCA5+jPUxSSxObHnh7e2
	 J27bFmfXRy/Ia4c0vRz9iWHof926qO+aPX0mjJUb0ryvaeQx7LKYDlk7KCSBiP799H50Q
	 LhT+Ffvxtw96t3MBcV2QzflaRzPaC8xry8To3tfKavUKuNUIFHqEtjisBwVmjTR05g3iO
	 Cs8rYmxE3hTYKKs8qu/CCAbWIvzTN00kW97ksNQ+vRcjtBv1dI9y35FBYHJhCuD6sH+mW
	 56Y4WE+iPld3Qc81cZw1eSW5KPw4ad+B70a22biY06yZym8t52n42HR8tRWPjF69pww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659970;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=arPqF5uHzN93lDOnmPep40IQfCGLqMszgTkM9U8feYo=;
	b=jF9DAZvQaevYh5K5UbCttzbvzrB8Aeg3UPWYCjZGia1uTUzEkA5JwZ+HZvWfS/izFhVc
	 nSMQTiYAaky6iWFxPXqwLCLFUo3thw4pEvfqmC5NvimK+ECb/0kaBBLkIkfsRRHTyErux
	 sos2lUunuOgtWPqkBiSELhyeAH6wOvjzlktqi7YCs+zFEYj7Jgk96FBp9V1VakZOE4xeh
	 WgQbZblAaW1W1mpS6MnkBOyBIFW/CEgNbdWRe1MwsBjdF5syS6zMQhu//ieFDztqJ3pJk
	 ZsA93J8znkLgHaMnLvcm2NRYIFz61osvZwDw0nGPwGy4dLDayKzo9BtdzwhuoZfwpIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=rgEn5RSY;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6C0606D810
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F6C0606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=rgEn5RSY
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id NzUrxOativ0ndO0tVxBRjc; Mon, 02 Nov 2026 22:52:49 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0tUxZrWq1xnwO0tVxyC4F; Mon, 02 Nov 2026 22:52:49 +0000
X-Authority-Analysis: v=2.4 cv=OsxPyz/t c=1 sm=1 tr=0 ts=6ae91441
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=ftUHNBg9YGw2k4VxJ8QA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=arPqF5uHzN93lDOnmPep40IQfCGLqMszgTkM9U8feYo=; b=rgEn5RSYiHTt
	7EVrjvmDrPq8saZeFfee7Z3JrgNjdxwKK1J5SgWqLWa9clX2Gh3ZNtNRJ1RHJjJJ4Z41rdCMy1HDm
	Stiu4k+j4tP7+iTwtZasBQY+6FRAWFtgzW3OWDyLGQLfbBHjOUjEoITmSArQa3svnlRIISyn30Eb9
	KDdoDptZq6OpLkOmKECZZ6rclXR1jqDThQr6K/9pno9WeGxxBTg7DSHwQNxg53Jf/vx+CcnbBHlV6
	5ACSmGg4cZjN5vOgkvnsgbo8HnAkYCJ9MS0eG9ux+srpnkHUdgE6i8lTj8UinS9eV7lWocHRwXLYx
	VSh9aUjXsOhpsHofUmo9QQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:42280 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0tU-00000003joT-2VfC;
	Tue, 03 Nov 2026 04:22:48 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 004/102] hwmon: (ad7414) Use 64-bit jiffies for update deadline
Date: Mon,  2 Nov 2026 14:50:57 -0800
Message-ID: <20261102225235.334487-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261102225235.334487-1-linux@roeck-us.net>
References: <20261102225235.334487-1-linux@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xO0tU-00000003joT-2VfC
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:42280
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 27
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfH1OhXsXHjXcEYYp7Ma6yfpQitn3ehMM++VpNivU/t1rJQyHfioOqEJAd0FJunP5lbqNIYNTSdSTQFZaslucwTN4GqJURQEqZY01GvvHVKEz7etj1DgG
 dNUSDY/tcTCp9R+MlEjTHpvEx8I8gLHXMtqW29PAYmRAjz1yHUiyTGoo8HfXvVWKRLO0wQ4wENd6bt5nIznPNDWB6R75P7WkO4v+ztIRKdJdfrw98K8PZqJ5

ad7414_update_device() uses an unsigned long next_update timestamp with
time_after(jiffies, ...). On 32-bit architectures, if the sensor is not
polled for more than MAX_JIFFY_OFFSET ticks (about 24.8 days at HZ=1000),
time_after() wraps around and evaluates to false, preventing sensor
values from being refreshed.

Convert next_update to u64 and use get_jiffies_64() and time_after64()
under data->lock to avoid 32-bit jiffies wraparound.

Fixes: 6c633c3025c7 ("hwmon: ad7414 driver")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ad7414.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/ad7414.c b/drivers/hwmon/ad7414.c
index c2df631ae93a..fd3a49d5fe4a 100644
--- a/drivers/hwmon/ad7414.c
+++ b/drivers/hwmon/ad7414.c
@@ -38,7 +38,7 @@ struct ad7414_data {
 	struct i2c_client	*client;
 	struct mutex		lock;	/* atomic read data updates */
 	bool			valid;	/* true if following fields are valid */
-	unsigned long		next_update;	/* In jiffies */
+	u64			next_update;	/* In jiffies */
 	s16			temp_input;	/* Register values */
 	s8			temps[ARRAY_SIZE(AD7414_REG_LIMIT)];
 };
@@ -73,7 +73,7 @@ static struct ad7414_data *ad7414_update_device(struct device *dev)
 
 	mutex_lock(&data->lock);
 
-	if (time_after(jiffies, data->next_update) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->next_update) || !data->valid) {
 		int value, i;
 
 		dev_dbg(&client->dev, "starting ad7414 update\n");
@@ -94,7 +94,7 @@ static struct ad7414_data *ad7414_update_device(struct device *dev)
 				data->temps[i] = value;
 		}
 
-		data->next_update = jiffies + HZ + HZ / 2;
+		data->next_update = get_jiffies_64() + HZ + HZ / 2;
 		data->valid = true;
 	}
 
-- 
2.45.2

