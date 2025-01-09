Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97B877102;
	Thu,  9 Jan 2025 21:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736456843; cv=pass; b=nheZ1PlhkUC5OZCrM4GeQa46I3Iia4y00G8UhLKrp+xWdN2CxcVXQKqE6zRZLV3bUaIRm/uWjGyWX6Gei0MuPxgWb9+OdYoc2Dcjd5MZAfMQICDApQTP5YHD8D8Ko2WUKNr1+HSJZGLDBVKt0yf5mejUpXLuj3nPlyejq6JilQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736456843; c=relaxed/simple;
	bh=U0uKO4B5qn24jPXUCdWRTKe+2br9RjSn1tvXdbEENK0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=K0Yf92GvhfxpuOdgZNWBIUrMrPwM/CVsEdi70EHQZCFrcv6Vwn2R7y4Cllt7Rhj3ETk+uBMyHw+cJpEAK6LwzBhnUXACD82luFmrBabnRiDTrX3c/MtsvgK1VJn5Sy599baH2O4QV9Ui9sw6ZRAitISH7RQiT67UJFGGyYEXVXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radix.lt; spf=pass smtp.mailfrom=radix.lt; dkim=pass (1024-bit key) header.d=radix.lt header.i=povilas@radix.lt header.b=QSLFopBY; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radix.lt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radix.lt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=radix.lt header.i=povilas@radix.lt header.b="QSLFopBY"
ARC-Seal: i=1; a=rsa-sha256; t=1736456825; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TqajVGlDhqU0Prp7ZG9PQmfg3Y/6SWPkT+VZeN0WipqBM+17aq3FtMHozxLx2vQ/44CRUJkBAvZsMWNzXXK7QOX8lkQIu6CqbBlz+Lv1zbV1kA7/9jtvzJjCErJVer31wmNuT/AV6wjOpks7o+ZFhRWn8LPeZsoYpkcpkHiO0hU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736456825; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OLd8U15aujP1v+l9S0jKHD5OCD6CoGn8PSd/omUuvwU=; 
	b=JTtXCml9ETN74zmWr8PyJ9XJO50EbhVYt7N2sR6+Ov9xgXxtm2Mfn7KCcyYaRuruPNspdgShMnkJUE85erbU4CS1yWULAIseR4sRe3+ZhThuF5Dd4zx8wv7gd0jrC4H3MgWDNAHDRNSvg1oJ6Jr4ZkudewuYxZPVBFnco6PXNlc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=radix.lt;
	spf=pass  smtp.mailfrom=povilas@radix.lt;
	dmarc=pass header.from=<povilas@radix.lt>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736456825;
	s=zoho; d=radix.lt; i=povilas@radix.lt;
	h=Message-ID:Date:Date:MIME-Version:From:From:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=OLd8U15aujP1v+l9S0jKHD5OCD6CoGn8PSd/omUuvwU=;
	b=QSLFopBYDq+Pbr3MPF9OgA40p7KnrhYlT+Smekk3ptUFRLocCHmV1YQG2YgHZl4/
	5XjovUC2HakVf4ncXwAG9JiI14IZD+CKVDVHlmXnqd7sqqABaFKKZp//eyos+ZY/Rzi
	XMbxsw/xHb+o2ynmbIndUzVItOl/KT5KDIMEKbGI=
Received: by mx.zohomail.com with SMTPS id 1736456823159801.551884172569;
	Thu, 9 Jan 2025 13:07:03 -0800 (PST)
Message-ID: <6e6b7a47-d0e3-4c5a-8be2-dfc58852da8e@radix.lt>
Date: Thu, 9 Jan 2025 23:07:00 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Povilas Kanapickas <povilas@radix.lt>
Subject: [PATCH v2] hwmon: (dell-smm) Add Dell XPS 9370 to fan control
 whitelist
To: pali@kernel.org
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Add the Dell XPS 9370 to the fan control whitelist to allow
for manual fan control.

Signed-off-by: Povilas Kanapickas <povilas@radix.lt>
---

Notes:
    v1->v2:
    * Use I8K_FAN_30A3_31A3 call instead of I8K_FAN_34A3_35A3.

 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index f5bdf842040e..cd00adaad1b4 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1544,6 +1544,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
 		},
 		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
 	},
+	{
+		.ident = "Dell XPS 13 9370",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 13 9370"),
+		},
+		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
+	},
 	{
 		.ident = "Dell Optiplex 7000",
 		.matches = {
-- 
2.39.5
