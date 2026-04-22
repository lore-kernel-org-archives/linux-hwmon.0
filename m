Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D38394462
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 17:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776879816; cv=none; b=DTx+7/7ANHXKUp04Jb0+YGiyeRyKm7INXeSTLxBy5JvZ4k01ZVZmhYOlkaDp1WB9QMbGjEZpf3u8k7D820XZ/CFnQjqqSkT2P4DPwbW3umWQxtf5XXAxPzWfgLjibhdiIXCyE5f1s26zEwu6w0UHyhUz7Gv4P6xax6Dqo7U00+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776879816; c=relaxed/simple;
	bh=2qBk2ep3/UzHtxWczG5M1hr5BLVx8K3kTzC+hO/UzIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=irreOg/JHsCG1T6y7i8bQCsf4Zg8uaksbdVTwyoOO/OvsX0jfbQZXrxXFjRWpSBJLYtvRHII7PawkVwbDvDYg53XZsnhZDBxbhmRlNjfEPbv4Br5B6R+xFhgL/vOXTB1f4sPlCQ8noT+ARSqa6voLG0zI3/IDZ2zNWudjLjuTao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gFqx4ZK0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TGFcBDqu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gFqx4ZK0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TGFcBDqu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MGqtmR1219338
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 17:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ocRAnxbNzf3
	8+DhYm3zLq1MLbyIrBdT46oxuz56xG+Y=; b=gFqx4ZK0zE1RJrNUwZAMZ+jYkMO
	I+eHmCgc1Ge3ZtrY61jSIPrKvc1wPf1rJ8PolgANmNqSTsr0gjAweQcTIM5UqW1A
	vD4b7puo3+aKHlxxQCmDuIovGCzpQF8IPO3TLQjlJUKaHRBF3DX8oILp2U+PaP9P
	NTm1la4rZUKQtye1q46tBflAgLypPFklEPavbxXCSEPibG8U/dIqE5CQCuFh8+7w
	bSa+hDDTc8En7EUuZn9Gab2seV0zM9cxjSVoOTrH332klUr6te3spmX+Lj8ItqKI
	05zEWlLNd8UsGzObiO9GwJlhXF2mkbULB7UYMZ3U0mHBNozmnvh9XU3ka9A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq282r5t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 17:43:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e5a336b44so41073131cf.0
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 10:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776879812; x=1777484612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocRAnxbNzf38+DhYm3zLq1MLbyIrBdT46oxuz56xG+Y=;
        b=TGFcBDquDBbAB4zvue8vKQJ46ydXlbMC/Y+UR8aNX/7N1TdjVk+q2MOIgiQ2aWKfOy
         zCb3/bCCHzH76wOAdXngmkPWP87CmOj+mj6AiM1mmEXPrVa1k7pD7tDyP2TaZJKtdSGv
         vfVs7HWWQZDzwci4P8s1RrQqRJnBfQBxTFWn+lLJudmmwyyr7KgYiu8HVJt4P+dOZeJP
         r3sMaOAFzD6s9wMTLwqmBTOS40nXup7M/6j7sOcOlp4oMor29m1mqg4pZNAEZmUk28Tp
         /NWeSWK4cY2/qDKkK9UHODRC5m6ESuGML7n6xnpXtF5lLEYurAENFJeVoUeBMgh7rStU
         Nucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776879812; x=1777484612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ocRAnxbNzf38+DhYm3zLq1MLbyIrBdT46oxuz56xG+Y=;
        b=LFqC73B7agE4xwwkP5x4+i+fPv8hvLptaIoGi3lnMA9vYg09bQl/4Fbx3vA/lI60IF
         kvLAEcvsFWD4hsQeR3psVfSw08cGvJiL4id+eRKgzWZJKx4ODOtp3ZT0SRLwmHcJT6Wz
         ik/8YjljILgAdc3Uw9deahBA/SzFFEDq4236a1LsFgbPFosVXFeArgWioHiadmxzD+kI
         8yXR9ICMPkmjRbR6tC7UNZAuvkCHWUR0dh7/b9ZlKoMO52qAe3mln1U9sT8F78PYJTfU
         xl6VHGaptgjdzYBTpTgt0EWMLhG0b5tSo7B8CBBW/FljPWiyLL7xrLgEdkKfhYENSU9g
         y+kQ==
X-Forwarded-Encrypted: i=1; AFNElJ/XDofQzSLs5glJC3xFlJwY1QA0zd6IBQr0c4TPLBCdNNyB3dOf3PXA3TDLfjs0PiR5AqI2Gc/uW7/Jbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YySMhBEPmTTtjZb66ySrY0HrF9Y2GB/amRRyNfJRfiiXw03xQcX
	GY8L6JpeIRf10+NI+ncuMH8GO3vp7UNRzmOZu/NBynM45wHbq6MkQg4fzgz5Ujhf6NxW4PxZsm/
	JDWOYZyvALoLv/i0mlQjKSEygfxEmunzgOQ11zkADVEgnB6pjmdphdvxXmq2sJtvWpg==
X-Gm-Gg: AeBDievbvRfNmFkXsDEv9Yy5dt7ib+aGrXC4SYmhJagah+brLPx99EaNHD4u95djD1U
	XczbluPRvf+WNsX74JHz7rNz9hnppHkiYxRytZf4+u2qfyqglDdtCBHrM9FTPk9c84iQRObktzo
	/rioqdf2k7SIPlT2winMFmD5322Jnk9HH428UPBFwz3apbj77m7p9K8M1SLZME4Q1C5jwP/3OhN
	wb23gyvyRJ3ftnV47ltvjq3/+308M8qx1vBY1+l5zt+y2NHOHAzY0/Dd8YYlV81Xjae+Q3D5xSK
	cpzzJZee3RoarzobwoQUXhnPpQsDnzqg2scA5PlQo6i+JmvE30i3VVMNpsEtf7I9WrPf3yBs+/j
	r78+nfX9AFPq4ABYPST5whDVn8w2ryBQ1s7AZOo3wYyczSXmGt4a26lS3oYB2
X-Received: by 2002:ac8:7f55:0:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-50e3664bc7cmr315857951cf.14.1776879811910;
        Wed, 22 Apr 2026 10:43:31 -0700 (PDT)
X-Received: by 2002:ac8:7f55:0:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-50e3664bc7cmr315857311cf.14.1776879811420;
        Wed, 22 Apr 2026 10:43:31 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7a051dsm142511965e9.18.2026.04.22.10.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 10:43:30 -0700 (PDT)
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
Subject: [PATCH v2 07/12] thermal/core: Put of_node field cooling device structure under Kconfig option
Date: Wed, 22 Apr 2026 19:42:56 +0200
Message-ID: <20260422174305.2899095-8-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422174305.2899095-1-daniel.lezcano@oss.qualcomm.com>
References: <20260422174305.2899095-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3MSBTYWx0ZWRfX6INdS0lBKRlI
 rJk/vGAZQdth7fIlb6LRzPHXKlhexfV5yKk9aSe4n8GYSoxPMhQmlLb2ukwAFnLleTM7F0LDntk
 mzBUt5JrP12LIkcmBwMuNHioWR42P2s/OCO3seIH0kU+81P3yZuPOzab0L/rR4YWlYtbVN9D84l
 ZFJm2FJif424eAG7rCsRpOMlqS3Hz8S/AC7o1nNG/jHMSABe6XIEOvP9y5kdkNG89uKZ62d86XG
 X67h2m7ln7LAPNizmaMsWTVv/KyZUvm3X+PIGZ6qfbbk1DhmHubB9FjkYCsMs7X9Tepsy/Dtjn9
 CsiEhp161HkGU4YW5Jx1jjiKJ1TGY0+qiKZrLvLcTx4kndBdJjjchmsPcjKr/3caWvoqqiiGqkA
 hN4g+3AMMVJi/XJ2QYagor1MjyPH198x9ed2RaU5eD4XvnSyTwpHijLgdKJq1qjsIdCVR+4Bw7j
 cCSUVe2PFAg6onLqCyw==
X-Authority-Analysis: v=2.4 cv=Zond7d7G c=1 sm=1 tr=0 ts=69e908c4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=5aU8Z_IAf-MFAndoPNkA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Z25bGy-A5r9kmqTwLsC5VkR0rwYymP6X
X-Proofpoint-ORIG-GUID: Z25bGy-A5r9kmqTwLsC5VkR0rwYymP6X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220171

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
index ba2c8b4dda87..0a95cfeffa74 100644
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

