Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF9822CBD9
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 22:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795382; cv=none; b=Aoy8V9AuZddzg4V5/8NuZX2QoOoFlaXbwwa6UV5Kw1zwniWSTN1XySRbSzThhYTpJb0OaWYdqV+wOFczoqpAR9zX0NyAx0zOMvo4lCcaTN5kEEWE1J6lS/i+0q6jdUvqcYoYHH8ro5awAA5TnmoR1RacfdFRvMbGoVaM1RV/F+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795382; c=relaxed/simple;
	bh=wRf7seLg/PtIoq4q0F63L6Ynk1VyW+y1eS+2VnsaHaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m4cv9Shh0bUMqnGNT7oXML3vBF8SpDmm4MRf0lm+ZxDhFDHFSvCRNLGTjB5mAyjFPXHIwcV5yPJC0ijYvN6/7MBL7WngaxP279/1DR7PRIlwPVXsHoBL7z2ikJlvlP6RfFXrijDZGm1aGZJDiCMOKNE+wgMS8pxvS+658eHeOQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqWLP4sJ; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqWLP4sJ"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso2941613a91.0
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 15:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785795380; x=1786400180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+ei9qP/3pDlJdQw+OQB45Cnt4yPxyeAe4Q6yRcLbjU=;
        b=AqWLP4sJim/QpUe4htViXKmmyZHPquOohotTStayvneoJZNsvYRJ0bOzH7xJw1LiV8
         lxZrvqKLgNy78GgHXLX5PlAre+V53WciA//yn0Qbsn3I4DA/B0dpmY6NgDtWRhbnGrW6
         8N1vuQh73gl8d9sSKMuejTlNbh63PRPlhH7chKoouFPxBEU5Es0rKEn0w0ECSB473/+g
         OynkLBXArt0kW7eC9JPxjUqVLt2xZ/QsGxqBXQdP+4c52TvzA9gQuk7UXQlON0mlZUko
         ipxTLXnfABOol8A2oUl+YoDF0iLdeMiFlhnMdnrlAPMTBb8OF9/NxpftBKq9I1uFnaI3
         26Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795380; x=1786400180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L+ei9qP/3pDlJdQw+OQB45Cnt4yPxyeAe4Q6yRcLbjU=;
        b=nFHQEt2UtRdi8LZwDCqTuWTBjGXJ3oyPyKp/Y437DVjXDFtyMe5LDwBaPbb/F3mkq2
         s1y+9W3OBUGzTBedzPVMKM955h3ZO0ZL5hZ1FV5+puM9Y2yGHOX9ttaj/Q2xyI1q/wBu
         HkvNdFw0esPzGf+5MLaEn2uZD5DgK3/hccJlT9hibpLLqT6y24mdMeHi7q4jnaym/LC2
         7vKIP7lwKSe0KHPwpMTtiTzOiSWc+HQlOeCntZX11EkoOzv9izi54f+5mVPWLsmhpo4J
         3vNfBd79paHix1v5wUaD5pKkcXJIDUb0XeVfElXYoCe2WGHY3LapNeVX9r50p+/AOSbk
         /o6A==
X-Forwarded-Encrypted: i=1; AHgh+RrZkxweiDjAPcCqDPWmVuTfzeaBv5/Q++qH7uxGl/EHDulk5NXk9eJMsCLLXPiY+AJ6q3zcYlCYtiQc5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbwTJkxqS68gwHqfN1mq1hxeEdmLQHS5ftDIW3DokT1KfEDkGj
	LuJSuCWzzbuNM+IPQIiyQHeEAG+e1tMk3HtHav9K3Ilqy2yp76XGX2+G
X-Gm-Gg: AR+sD1280CTVFo8zX90RT5N+zQ4cvQMmwvPwRwXHuDWhUz6p0aA9xaq43Vgl9RNscvZ
	RUycMxEwBVaqp8Cm4Beex5nwfpYxdGzymNLo/E9V3e8fe2k7Q65DGER51N7yC2ToV1Jg2YHCf7D
	woO/E8QpWt2mQuWeMpS9hHzizfG4+kucIZdQ8gmxFNi5dIYbaHfYj2pfEXPuxN+e91Wi3L9sUgH
	7NCzUwB320vWS+27OJC/yFBxocbJ8OF7by1duvFwNahT1Aav24gVtaTCrJ6360oWWtBdXoM8za7
	F8b36nkjq5+7KnwKU9WL8jAP4DW9nVngI4lqyHH8HSy/V9IkpXM9FMf9o/ss8OH/J53uWaqiXpj
	X5WA5+Ycz4WjzdGNe3LISsDb2JRyacuYUh0OI+oY8xtlHMde+N+KfbOGgA4iCxkjTg1N0uPhRS2
	vr/WhOauRzIJhg4wEgKriYSmgJFiOPJMIvmJv+oxTB7b6W3nf6hcBQ3co70t06Q3N1pRHjgphQ9
	NTVMU9jyIq3qI/xbgXwp1Gtt7puJToKt46cFNGPDw==
X-Received: by 2002:a17:90b:3852:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-38fbc46d032mr9505429a91.16.1785795380404;
        Mon, 03 Aug 2026 15:16:20 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab1334cfsm38685666c88.1.2026.08.03.15.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:16:19 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: lkml@antheas.dev
Cc: W_Armin@gmx.de,
	corbet@lwn.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jdelvare@suse.com,
	kuurtb@gmail.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Subject: [PATCH 0/6] Re: [PATCH v1 00/10] platform/x86: msi-wmi-platform: Add fan curves/platform profile/tdp/battery limiting
Date: Mon,  3 Aug 2026 15:16:08 -0700
Message-ID: <20260803221614.59324-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20250511204427.327558-1-lkml@antheas.dev>
References: <20250511204427.327558-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While tesing this series, multiple issues were found that cause crashes
or compilation warnings. Additionally, since this was first posted, two
new models have been added that each have a unique feature that must be
managed before TDP control will be used. Given that Antheas indicated he
still plans on sending a v2, I'm posting these so they can be
incorporated in the next version, and so that distro's packaing this out
of tree can get the fixes and additional functionality in the meantime.

A summary of the changes are as follows:

- Patch 1 detangles a guard with a switch case that violates cleanup
  rules.
- Patch 2 removes an unused err variable.
- Patch 3 teminates the quirk table with a null entry to prevent
  unquirked platforms from crashing when the driver is loaded.
- Patch 4 cleans up the device quirk names, fixes a bug with when buffer
  data is copied as a payload, and adds separate PLx limits as indicated
  by the windows DLL, if pl1 and pl2 are set to the same minumum it can
  cause instability.
- Patch 5 adds support for gen 3, the AMD Strixx version. In order for
  manual TDP control to funciton the STAPM flag must be toggled off.
- Patch 6 adds support for the 8 EX Ai+. This device uses a new shift
  mode, called "manual", to enable TDP adjustment. Since this could
  conflict with the existing "user" mode, use the quirk table to
  specifiy which mode is "custom". As a consequence, "custom" must be
  checked outside of the switch case as it could be one of multiple
  values.

If you incorporate any of these changes in v2, please add the
appropriate attribution.

Thanks,
Derek

Derek J. Clark (5):
  platform/x86: msi-wmi-platform: Move guard out of switch in
    platform_write()
  platform/x86: msi-wmi-platform: fix: Remove unused err
  platform/x86: msi-wmi-platform: Clean up devices
  platform/x86: wmi-msi-platform: Add MSI Claw A8 support
  platform-x86: msi-wmi-platform: Add Gen 4 device

Matthew Schwartz (1):
  platform/x86: msi-wmi-platform: terminate msi_quirks DMI table

 drivers/platform/x86/msi-wmi-platform.c | 151 ++++++++++++++++++++----
 1 file changed, 127 insertions(+), 24 deletions(-)

-- 
2.55.0

