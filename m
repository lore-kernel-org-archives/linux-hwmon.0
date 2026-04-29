Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722413FFACE
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 16:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777479295; cv=none; b=stHX3dcEMhjo+JMxGy/soIaHXRqK81Wz8cpEcZMlzndX7W192qssG6gYV15NEB537Jm6JIEgLkA2rfP+xjsmTT7T0Q8JMKVHFT0sWdW+XTOdFeKY0B8TIucz8bPFZwndDDcVHQJO6azWMpV++B/iSjoPc7RW44h1K4kVWbnGtrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777479295; c=relaxed/simple;
	bh=8Ds5xtxFWeweGbY4JmIoQElbN9Q78z7GjPvN5NTvYes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IcZsM0s4f+3unjipEWl4FH6CaWtsk2QF4/2ooaKVe4uuxs3GflA/AU1lfBw/mfJD9xCtag8WEq4AqhJev94sx2bSJDL5dFRNVkAGkaGK6L+bnXoAHwXJK5CJgr93Cc5w4qhjcauHWUuUsR2j6aKfHSkEQbLyB9YuPupOjJU2zg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oytIFMrS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ze9wlkyY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oytIFMrS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ze9wlkyY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFTBKM1642726
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 16:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=90AIa8NaCz+
	zkROO+2dxfNcs3zR8w2E4Z25myBlHOTA=; b=oytIFMrSelK7QEh/l986iwfINGm
	MA1VkwAQSTaH/BTsYOsIlL8q/l+85jXhcj2RraZNJi6KLNK7DkUiACr937R9zZ6D
	q+V8SE5O2a0LuxJ/++k7TPJBmQr/FX7uFCukmoHF1Eponp9XSJ+R8DjGHjn38LVx
	VcD1VGooUX26g40jjPZIkHt0SX7c/9zKf13CE8elfbCxor6iECQNem+U7aGTxaNz
	B4dvf/fLf1MYnhWR3g6eQZxgtKW2VzKPedU2JdZBVL2I5jD1rg3D5APbXTmJ3Q6q
	RlpwxHsJBtYx86465WoIB54msZq7eOCunzjjU1MABDiAuoBg9/3RMGPCixw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj82dd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 16:14:49 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f66493ef1so6872080e0c.0
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 09:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777479288; x=1778084088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90AIa8NaCz+zkROO+2dxfNcs3zR8w2E4Z25myBlHOTA=;
        b=Ze9wlkyYWnkXwztl8tGYO9PUX0DzvH7AFtkljcvdcXcl6KpBEyrJQyVKMOUBaPft56
         NHZ9NOl2DGXvqpM/EFQU+FZR2jIcQ7v0DklE6Lcwzc4WZqyRok5jGMZzjGLPFDjEe69c
         QIBHmFV8nSfklh3ciIlZLWq05aoc/cwwroW1oiGsEWM67z7zh4GF9TaZYuReidA28xLU
         Yctk3alZrLavJMITuZOWZNDUnqQiYfFJiFBe+SHxjASLeKuhxKuElRzPxx2hkyjIZFdp
         T4Dk4hQAtJ8zF7f8v98PINoO7ELGbTZ+FaRDu3LiXJYihzemErpsO/P6ixehOW6ekHiy
         ntgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777479288; x=1778084088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=90AIa8NaCz+zkROO+2dxfNcs3zR8w2E4Z25myBlHOTA=;
        b=GnPQnsfrddd4yUq4feC13+zbC5rPiRhpNtpp9G8XynAHOVv9zQozHCS4XvV++Ac9PQ
         rdkggzUjCKLrh1+uHd2jICDO6ZeLGxJUVDoQoAaT1ZtNiFQ4kKNTuKd0mw0mWBTteICF
         ApJVPfeGZcgyEOhUSRX3/eMxfxE7BV5tA//lqa2crqaWhm8TpVgbieX6cSezIDIsaXba
         8uey72y7dXV1yYYImuxUYlJ+5Mr6LDn7ijTewTXeePgdE7og1AK5xURD/yME76IpA1n+
         F+LSuI2hNJyW1bVfqFopX9Ph7ei75SOJ+2yEq1nJmZaXeDGl1pDgiD93XvROKV+wyk83
         lsUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+sdcdaE06h9tmuNMQuWOBYBtd78Phf4ykcrAn/OqDq+LsVQdSeESN9QBC/Xtm0vXtERbM7cqVQqjNGOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkkvZcsu3H+8ke7WW65o2YKB3DY3kAfJ5S9Vxf8xddnS07Thi5
	pG2r50bJWezi9JNEjduG3yytPBS/in25yQjSVl9c6iK7M8BcVvJjpmnNw4oSqRfsF2s6EbTBQqD
	0bkCbRYAPY3ninfmzp56Ew6mSjD4FHioVcTD41tO79Gelf0XoQRVy/fja7inUqQj8aA==
X-Gm-Gg: AeBDieuLciQDk0Zo0uCBrDKlVmISi5KHr0XMreqlFjBUv/1sjivvPGVB46ysmwfMs+A
	lwKCw+59zIh5uQzqszX3ajNI3Fo7HAh0rF2v3/YUpvcIlzLmVkUCoHKJLQ6oDEtneZIsxXF2YVZ
	kD1COieic5yYeLY1tz39/hSYDLrk2S4K2PHzbacgzIfcRZc2E+iqx2AqeC/gnkdvjJj7EfQEhMe
	eZbcmDtD+e/C6yvp5L43g+lKjVX+N2c8ZQ/16TEAnzPl8c+30G/E7/ywiBLFmCk95nrWBSc3uWg
	BVi5k0OSg4ZE1j0yUJc3enjFDnDo3ucj2JPd0wIANh5lfRO3n5U96LUQd74ITn0ekKtsi/o0/kK
	ojWYY7KU0gRnUJaJ+Cj06gbj14IkCrT1QAvVqw5J7Mm8rHkkPKWavjqVLNkDW
X-Received: by 2002:a05:6122:3109:b0:56f:6d27:cadc with SMTP id 71dfb90a1353d-573a55d8ed8mr4558060e0c.7.1777479288543;
        Wed, 29 Apr 2026 09:14:48 -0700 (PDT)
X-Received: by 2002:a05:6122:3109:b0:56f:6d27:cadc with SMTP id 71dfb90a1353d-573a55d8ed8mr4557981e0c.7.1777479288067;
        Wed, 29 Apr 2026 09:14:48 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed659dsm2438525e9.2.2026.04.29.09.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 09:14:47 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, daniel.lezcano@kernel.org
Cc: gaurav.kohli@oss.qualcomm.com, Zhang Rui <rui.zhang@intel.com>,
        Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [PATCH v3 05/11] thermal/core: Put of_node field cooling device structure under Kconfig option
Date: Wed, 29 Apr 2026 18:14:18 +0200
Message-ID: <20260429161430.3802970-6-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429161430.3802970-1-daniel.lezcano@oss.qualcomm.com>
References: <20260429161430.3802970-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: EYyMxm9gHM91H7EvW_2Ff6g8OseS8mOc
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f22e79 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=5aU8Z_IAf-MFAndoPNkA:9
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: EYyMxm9gHM91H7EvW_2Ff6g8OseS8mOc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE2MiBTYWx0ZWRfX/Q7JZdxoV0E8
 OTjfdw9tE7+N8wISZ7Hia5u7G8Jv8hMFIzOldLT5Pm7j0VkU/0xLcFlodW4VdB0kSGIRq3RPWc2
 GzpdtCFdzJQYlyfjlIyW05sRmqd/l2jFfEIU4S2k9QwU7VR/3k8Qzrmtn/ON34R70unYL8QXoY8
 A973Rj5TH7Rut7kF1G/bgCD0x4A6fQqfAh5XdStQ88RmTcwJBXAcqOe4HVODYKVjKMzAcV23MZW
 oR9pn95oR7uKzdSBm22Onk2A7NccJdJLaqaxIpLqYnGQz+Xb83KcTxUHpaohLp9+Kd83nos46kT
 npmFQxWAFBmlg9SMtXIC67o9v1+3MBuetddig2JGGXy53lLs0wGACZzUUiUYRfL/4mD73mre8pT
 7TGYnLJGS7cAUr0LWfdNq2NJt/Ve1LX3cgTQ8aVybLzc+9pNC6G8sMrqgA3OIWpz56NDdp8mcZh
 t4vrGskq2Y9HBOeHErQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290162

The device node pointer in the cooling device structure is only needed
by the thermal OF in order to bind a thermal zone with a cooling
device. Now only the OF based drivers are using the thermal OF
functions and do not call the function with a NULL device_node
parameter as before. We can put this field under the CONFIG_THERMAL_OF
condition and make it go away if the device tree is not used.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 include/linux/thermal.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 50b43e328ab9..eff01fba0c81 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -125,7 +125,6 @@ struct thermal_cooling_device {
 	const char *type;
 	unsigned long max_state;
 	struct device device;
-	struct device_node *np;
 	void *devdata;
 	void *stats;
 	const struct thermal_cooling_device_ops *ops;
@@ -133,6 +132,9 @@ struct thermal_cooling_device {
 	struct mutex lock; /* protect thermal_instances list */
 	struct list_head thermal_instances;
 	struct list_head node;
+#ifdef CONFIG_THERMAL_OF
+	struct device_node *np;
+#endif
 #ifdef CONFIG_THERMAL_DEBUGFS
 	struct thermal_debugfs *debugfs;
 #endif
-- 
2.43.0

