Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2524D98F1
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 16:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690675; cv=none; b=LcdnpDzd1crc8RqKPI4/8eNOEGUCkn4BplgHszbmDiQ+BsNPrV/SzhkoHCGnCcOXHMRrwetEmOs7V2hbpxaa9Uty5IWJJC/jj76Laymqaf6/M3nCeZF0U/3HHuePUC3si74dGz3n2Zc0XTpgP4WHB487idaXeVvbOAojl/uOqY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690675; c=relaxed/simple;
	bh=vAmyCpUIu9IUlplJc4rGmydGdjUb6w4tYNaPIxlBDiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KFxQp6iBJdJcJt06Zfw318JDhNf0mxyS7E12QOYnlcQJbaClSwPwPgvhG2EGYTR7sNZkG/jiPzQMxdu3Gj5hhlU7COAoqoUYOc0V/gtfwx0GhgZjNDDiX94aJsEnA8Vqzx21N6MqZaQDPe/UihBHvpiIomQIXUMni7vwvWMiyYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cf3SfnnL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ToXzwvRY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cf3SfnnL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ToXzwvRY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DF2oIs3474770
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 16:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/yocMUcQeW0PxY80907g0p8nmDgbrIZycpfry1XcMUU=; b=cf3SfnnLkQ+pkgYE
	MS33afG6mXyDivAhUfoDnbMgQdWM5SSnBmh/t+YQKOk0CzSS/H/p5gqggy/bz+Ld
	kUoeG/PH+P+Eie4YA/PuNweQtcaYkDgPM0jm7xDzeEYM7+OiwaPXJH62mTGO8gBV
	HkYv3MlyhmuzTA3I4+Y9vOzgWX/YB10Y3VMfzdwYDL78aVMwcC7J/KI372xBw8a8
	kSKyv6hUieVWgbKOybaOU4o76LKGM0LUtBCFKhnR4PqdlM6igEomq6tPPCAIFHil
	f6CH3F03k4IRfc171OnKO4bJwhW4Dz05WUK7ZrOvWveSOSxSzVof79L1LLSz6o7N
	w8YjVw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p419vdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 16:44:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so6051100eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 09:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778690670; x=1779295470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/yocMUcQeW0PxY80907g0p8nmDgbrIZycpfry1XcMUU=;
        b=ToXzwvRY73EYoxvby89bNOhglHuAmWspKwPbnjoFHnQVXYiTUCfWsHGjAB0b//pfas
         ZPqZZF9dz60NsHH1IEJjPzxVx1HYcyxUckzWbMPToJwZELBL8lpoS1127a9y81G2bQTS
         2dvPBP+4hcGQNL9LoC/YyARtFlYHYIg+Jcv8FQYr7GIQdjHLbz4/K9ximKMvz7Sdvr+q
         aT95BE5JKt8JXTb7lC1iLDanTzDP6fzJuQsSYT8AcL3FJQ9Na5L+EoGis7RfKMPWAXil
         lWFpSwHLZCbE8yb55Hgj39+9rktZx32gOWbA1kEdu6rXAkaqE4sfD3nDXJO5Df+70HCV
         0G+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690670; x=1779295470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/yocMUcQeW0PxY80907g0p8nmDgbrIZycpfry1XcMUU=;
        b=LGEj6ZMhh/QvGRni+tWWj52VIESpPHB4StrIVUA+xnve4WI1oMv396GYC+mVXYB3Kl
         KqY7j5whGOIdYN0KujSGW25dc0afpkA7nGK/QpKpQymi/8ph4270MeCcfESZBV+QGDKq
         NAe7Mizjm9jItqW5Za+6U4MUNT6HbPB19L0wQKHpreE3IGQFBRcwHUOM9dH0raGwPany
         ZuesenFhHrXV7DVwZDJPXaCkkhnH85DxSw6Aun67qWKOm7+yG8SaP2ICUky7sA0vcTqA
         sAw9wvpQ7OrIRZ9yQSQEsQrZDWGCfro/HF23DsSPk+xez+Ybw2tlunG8XQk6B9+QsFko
         pwSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+c3ZyGSlF+flq0SGh/W5G43XV4+b9MdS7L04rC87LuaDi5QXHU8fOPL1GVFPdmntd4NZ+NXAPGoSq4sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YysJWrueQv+mpHV8b2GWeN2uvN2SFll0+KGT+GO9ucsw2asWPWv
	pJTwcjKuSiPsb31B8T3ZdoGfcBZoFJCPXmutYplNWcKnz9d0tT9NpdMQ7Zvb3HhST49tjhxWxxq
	k8SmsIOffCKAZ5KyH0domW+ChQowLo3IJnuE438sNkT6c8rV6jEU+7TVEOyvzQcDyxg==
X-Gm-Gg: Acq92OFgt411aVYfSE2z0hRiKjj16m4IjwtfFOfYjmgkFjd0pZYZlbsVgFFS8IlFVXX
	JcN+xgCSBhnGp4IADJLmfZVTCcp//Y3J+3+m8ANFEJVtaMT4NjYktsRsntia103U3lCPeT3ugCk
	xnq9ObDhQim25BIPNRSTocZ0mi/KJq3n658/Sx+GAj8ThCIWJs1MK+62U1qVeaakmEY+fmBFbJj
	1U/O0Ukv7FjA4J5/VJn1RTQSZg1/2gUSYJU6xqsfx/I/k0SnFwbt2VQlYAmBeaL31ksck7HlAy7
	iUi4aK7TolElwchEh07I9zuGqAnRdEVKpWoD+LveylDSni9Q5YrkhChDbpTbCkfcgcWJBvBcld3
	olcl6clu9JV4Fji9kS8SxEAf7RQCYbEif0F/f3M1atQv4LTeHT9QNJVWt0Y3U8gxGjwYH4h4=
X-Received: by 2002:a05:7301:608a:b0:2c7:3a7:c792 with SMTP id 5a478bee46e88-30119874a96mr2588007eec.20.1778690670402;
        Wed, 13 May 2026 09:44:30 -0700 (PDT)
X-Received: by 2002:a05:7301:608a:b0:2c7:3a7:c792 with SMTP id 5a478bee46e88-30119874a96mr2587973eec.20.1778690669842;
        Wed, 13 May 2026 09:44:29 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8864c37basm22570076eec.13.2026.05.13.09.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:44:29 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 09:44:21 -0700
Subject: [PATCH 3/5] hwmon: scmi-hwmon: Log number of sensors
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v1-3-00b47b1be009@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
In-Reply-To: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
To: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778690666; l=818;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=vAmyCpUIu9IUlplJc4rGmydGdjUb6w4tYNaPIxlBDiw=;
 b=aHNXRLWpAchmivoKZfcxADgDkm5hnjgWYXKl8nVGRM6MkaZazLd056E8o8GAQELBgC4mw8qtn
 4cXbX3/bAUJB7GVGGgv4IJUzsVLQmNc0vvFg694a4U9/07cs9TUFFk2
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a04aa6f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=U6dIrDiPZIM1rF_tHS4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2OSBTYWx0ZWRfX67PZmvqpOAX2
 O56rH+N86qq0Q8MDD0ALl6dJ2qFKr9NXeYDz3+5WzVCVE6vAJnEo47frksvo76inzk/1Dw+xwza
 fLeTvwZGk9zS9YwNj6o8MmZPgjk1aXi0rC5m9ZGDGHXIwiacCHBgo81XulOm1p3RIm0RFV36NNi
 AMOo5WfqeGlcV67gMF0dahvdR+rAo9ZnS9YmwgeJOt3rHYy0XJ0MB90pjC1le9FXZ0AJHkwxl6E
 0lIOeTqQ5ltbfa2SkcJWbjEmjEqDzamABwJ3p/4TyKWPfCG9va8T57t4YR03JBTNDYt+1ktZVpP
 +1l404mtMlN8V0JVW1OjTtc36/sOmGnYAfvyd5cOTsn9rZ5ZgRpuBXnyATbvJW3/VDP1p8rZio4
 fLCWCrVD94aDeDU2Qyyj6qK0als/tqcXcnPPOrZRcEU+1C2hR3FJsXxLqNVyy4JubR6EkuSZgjz
 zNSJQ5aKZpd60JYq/kg==
X-Proofpoint-GUID: L0y9W_JE4kytvHBJVih-kJNOTcXOYwSD
X-Proofpoint-ORIG-GUID: L0y9W_JE4kytvHBJVih-kJNOTcXOYwSD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130169

The SCMI hwmon driver does not currently report how many sensors were
discovered from firmware during probe. This makes it harder to confirm
the firmware exposed sensor resources during debugging.

Log the sensor count after a successful probe, aligning the driver with
the existing SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/hwmon/scmi-hwmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
index eec223d174c0..6f1b0559d5c2 100644
--- a/drivers/hwmon/scmi-hwmon.c
+++ b/drivers/hwmon/scmi-hwmon.c
@@ -362,6 +362,7 @@ static int scmi_hwmon_probe(struct scmi_device *sdev)
 		}
 	}
 
+	dev_info(dev, "Initialized %d sensors\n", nr_sensors);
 	return 0;
 }
 

-- 
2.43.0

