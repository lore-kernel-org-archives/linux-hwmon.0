Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970531C84A6
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776622964; cv=none; b=UmmTuCZNXhYiIfhX/pcgO7Ac3/7lB57auGhyjSVo9wxcEeNhVV6O6Hhg1N1kvJpF9szaXWg61O4WjvhtgjrYySrWDdSDNCbMmM3ky8liilGE27eY+Z7bBVyBUyR5+DW5UHSyZ1SgEmhqnYNW7KHuAwavolD7VRv2ZtgreNrG6xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776622964; c=relaxed/simple;
	bh=4NqizYOexZ4No5CFQoDsrt2GHwnFslytgU20NXtygSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HvPTX4EL1kOJIABFBh5NAbtDClrtGNPP4i7dVhiR5aNWvtOk0cdwGTKOoFfBeAcbXtYKxTag9rJFnYiudT/+cVN9tH8K4KB7MWyBSBnh8urnZydLFJTm4vD6WYszt7By/bRW+VzkIGgwMIM+d7mogvDZPhJJ2hQmreCgeS5eNrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+R44qdx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1tpKkNy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+R44qdx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C1tpKkNy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63J805Ne3802532
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0kc7vT/328x
	qBLbS3QbJUshzIFJH1U/NGm6u8XuhqhM=; b=k+R44qdxcDDNjUXbM+kTK65R04+
	V78KnSgpLu4SdBHoXyuh3NqL/rhb+osXXm+XUmbE6aPjWCURgjXgYQ4TOnXVqv1H
	zl6CLVx6NhB2vv6kSe4dTFgTmsH1mMbFJmMIexXm4wOFkuHFthlib8qmqyVDy1+S
	v6voCKE57lAX2cpue4lJQcvT4hWoT9mcMHFygmQLTHhjGx6K8iBzV2233e2Zj1iu
	rXiqpJOs08F6kCPvfjWscz9/Rz1xVlaoiEUhyMcaU5YuFZL213jv1WopOpPh26rC
	3eFfhWnDZazQbYeKnwlFp52VlW/QVbpCTbRwaWK+0QxB1W6im/BmcL2sXSw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2b72y2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:22:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4076dc16so22368421cf.2
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 11:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776622961; x=1777227761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kc7vT/328xqBLbS3QbJUshzIFJH1U/NGm6u8XuhqhM=;
        b=C1tpKkNyHuFJO4mUzq/Vy5Vl8at6FwnBVx1ibV5BRk5ymk6l88QnbHixJxO8DqVVyo
         q1lMOSlU5gDqW3HaMYSOavAq4cVQfrG16IQg6L37QJCMxK+7aFte2Yd9scXgg6hOMZRr
         l4ir7qQitjobIvXmztCTl8Fh0J7U3Y65mEAYjevJHSvv8lOttLz3M15i62SsYR3xZKAz
         cSv+eLX3ZMNSFaM+joyJVWBGFTlJuAlO9SLQAz06xSwZx5QBCb1b8vGqycd/1RJyrDFh
         6T4sVF65R67wf5XhO5BbmCMNYROhukq6t2rqCgzpV1F9zcnuYQ6K/62RCV2v0L/HEgOV
         gm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776622961; x=1777227761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0kc7vT/328xqBLbS3QbJUshzIFJH1U/NGm6u8XuhqhM=;
        b=b3fdc4eGbW7N3PIGdq1UHcR6s2I1zEM1HgZI74FoWSEwGc04eRx6l87FfhWDaBaR3P
         HdbTNiovSR1w86eRQO7YeavR9wqqq+jJUcu8WicvBSviFJMt0lYgxDdRLlya6vQu7j+w
         /kLzexFmq2qXQyFigPcLIp+UB+o9z6rDPKuvVE16N6j7cOb6M1i2xPaZIYDcoKwATIXg
         z+KdViDNRhywv0L9sutuzUeTt/Pr5VawUBAbYScAWlw+0ztRPUTvlCxaK0dm9rSM0nE2
         m7X5fS1P0rrKpL5NK975X0Q6BtLSjTC2Cqw7g2oUy26bJStG7GTnGpchQ6MnYBWRy80D
         uD4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9u8+PFE8oEiEVp5b5PYE/TcQ3h5CHETgyzrJJ+XZlhsR96+aNhu/VODzqd9G3xAokajhc3qFAs64ReCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+QOuzgqEHX+Knso0gLls9+mCiMgzrHxLQBwTeUMx60OaVdgZk
	3GxW7u6GiQNuYITiafnTXmPABNOoLdeDS6ldYyr3Xgn6S1TpmYIUgbNLk4RuV9VUp5v+TuysTp6
	kx9leG51CgGyAAYjxkRj2qWz4Ts7gzlb0QLAQQ0Mkub7SNrYHbjYG9wDI7TxguidoPA==
X-Gm-Gg: AeBDiesQrft7wWe7fJMEzR7bwiaV4gYwz+93WMwOKd0ReQJD4J+N3HFZeV+U9XBQ8XS
	D0pyxhi2poa7LInAN+fyNQw9h55ZIBcu6zG+hezhCenQf7RlPduhDvnI1bgjFijqrleSpwjM6VZ
	aZWH2Jhvq1aeWyotpuTtfgDS3EAy+WdTq0qvAT1ywtBAH7PTpkW2bBY95JwMuDSNjGC+AB1lyvV
	GM6LgyBvo5OQnejfw8BEj21288/p4xXabE4w+Zrn5OxVCiQJj2XFvjloOhpah2X4jS4090F5Cu4
	n+vDFdO+pGn2UZ1C2GicFSi1aLwV7mxFsafDY47LvlMWyRhJXSA0YGOOMs+aL8IRCCInkzuPDP2
	FGXyp6crYXMtsd5sMdeHwmbAAjOFcDm2PnU/d+s/IGPHs6A2PyeyIC+OKmOoT
X-Received: by 2002:a05:622a:ce:b0:509:238f:ad92 with SMTP id d75a77b69052e-50e36b5461cmr163959421cf.24.1776622960975;
        Sun, 19 Apr 2026 11:22:40 -0700 (PDT)
X-Received: by 2002:a05:622a:ce:b0:509:238f:ad92 with SMTP id d75a77b69052e-50e36b5461cmr163958831cf.24.1776622960436;
        Sun, 19 Apr 2026 11:22:40 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e59f97sm25723070f8f.37.2026.04.19.11.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 11:22:39 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
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
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Subject: [PATCH v1 05/14] thermal/core: Remove node pointer parameter parameter when registering a tz
Date: Sun, 19 Apr 2026 20:21:49 +0200
Message-ID: <20260419182203.4083985-6-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260419182203.4083985-1-daniel.lezcano@oss.qualcomm.com>
References: <20260419182203.4083985-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KZridwYD c=1 sm=1 tr=0 ts=69e51d71 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=ggozHacZmVhwqr8k6bIA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDE5NyBTYWx0ZWRfX3c9AsKe6RLl8
 9OeED7SJACKhf+VL98fpDlZrB19BUYA5SD5gCW36pz7R2qOkeFIKBQOlW3oUx20dhDTg6WpZLc+
 zDfz2dErIDTnxI/VldcvlGLkxLiTsIvVoC9VYwbVjm830Ts+z9SSpORKhY7X257ClFMEnUhr63H
 Qdw6ssg6A843nY745nEKqka1sOtt1VKwwSrm0eFkeRwlk5yNwyboKkWF/krKYGTMM/jwf/zg6By
 lJ/FGzJt48HqWL7sK73izhOp4/nfUQ0eKYTdJpmR47BPo/Bgg4DtZm5eMzeF8La76aisr57Anae
 8P4mdEvSwZ9/NdLLoq4zvSpoWaePrFd8Q+ZFrMsi+Kg4Xtt9okfh5mxWptgAZ50w4HJba6xR+9g
 9mZ3yZJK1ppQQA6c6178mZY1vxMF/wFW04SAqAduo5JMfE/FlT203wzOfciw/KV1G+da/C+VSkG
 WhOehYy85fLagvL0Q/A==
X-Proofpoint-GUID: W9K_YQ4Em4WTKZwZB8L-N55BjQwBhz2I
X-Proofpoint-ORIG-GUID: W9K_YQ4Em4WTKZwZB8L-N55BjQwBhz2I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190197

Now we have a OF version for all functions registering a thermal zone
or a cooling device. Let's remove the device_node pointer parameter in
the core function which is inconsistent with non-OF code.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_core.c | 6 ++----
 drivers/thermal/thermal_core.h | 3 +--
 drivers/thermal/thermal_of.c   | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index 26231acea382..2f5d214d51a1 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -1042,7 +1042,6 @@ void thermal_cooling_device_init_complete(struct thermal_cooling_device *cdev)
 
 /**
  * __thermal_cooling_device_register() - register a new thermal cooling device
- * @np:		a pointer to a device tree node.
  * @type:	the thermal cooling device type.
  * @devdata:	device private data.
  * @ops:	standard thermal cooling devices callbacks.
@@ -1057,8 +1056,7 @@ void thermal_cooling_device_init_complete(struct thermal_cooling_device *cdev)
  * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
  */
 struct thermal_cooling_device *
-__thermal_cooling_device_register(struct device_node *np,
-				  const char *type, void *devdata,
+__thermal_cooling_device_register(const char *type, void *devdata,
 				  const struct thermal_cooling_device_ops *ops)
 {
 	struct thermal_cooling_device *cdev;
@@ -1158,7 +1156,7 @@ thermal_cooling_device_register(const char *type, void *devdata,
 {
 	struct thermal_cooling_device *cdev;
 
-	cdev = __thermal_cooling_device_register(NULL, type, devdata, ops);
+	cdev = __thermal_cooling_device_register(type, devdata, ops);
 	if (!IS_ERR(cdev))
 		thermal_cooling_device_init_complete(cdev);
 
diff --git a/drivers/thermal/thermal_core.h b/drivers/thermal/thermal_core.h
index 6e44bcf37b00..d45455bb9e9e 100644
--- a/drivers/thermal/thermal_core.h
+++ b/drivers/thermal/thermal_core.h
@@ -272,8 +272,7 @@ void thermal_governor_update_tz(struct thermal_zone_device *tz,
 void thermal_cooling_device_init_complete(struct thermal_cooling_device *cdev);
 
 struct thermal_cooling_device *
-__thermal_cooling_device_register(struct device_node *np,
-				  const char *type, void *devdata,
+__thermal_cooling_device_register(const char *type, void *devdata,
 				  const struct thermal_cooling_device_ops *ops);
 
 /* Helpers */
diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 85fc78bc9e73..3d2fb8f37b9c 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -533,7 +533,7 @@ thermal_of_cooling_device_register(struct device_node *np,
 {
 	struct thermal_cooling_device *cdev;
 
-	cdev = __thermal_cooling_device_register(np, type, devdata, ops);
+	cdev = __thermal_cooling_device_register(type, devdata, ops);
 	if (IS_ERR(cdev))
 		return cdev;
 
-- 
2.43.0

