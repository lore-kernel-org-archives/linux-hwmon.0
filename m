Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CFE3FFAB4
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 16:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777479304; cv=none; b=WWqbXAGws9VYXDd+itUGPkVpHlfUtqOjoWKuVATv6xxUCP/6QzBBTTTF4tUkzjHc2pYhySZCsKONB2PGr7vz1ew7sJi8TmSj+O+By+h0g9tMG4tevb6O07GQY2owq281asNFZafOVvDhcRgTZd3yMytJ4P+mSbSjd0+dpTK6b7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777479304; c=relaxed/simple;
	bh=fySGrZIShH9MyeZKFigUBZwml8ANCT0VYoS7eOl4p3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jEALJL6ViscL/W8AgSHmamQJL4FUE5UFtB7Mhl0ng8oPWmydnpgh3UQ8a+Fkj2ZaoWKH88qJu3U4LZK+bJjpdck7z65qOcEvngcAjFym4NGyFN9R4HYp5LoeferXwgRpyitT/MIVzQoxs+02/lTnPdnee14n+W4ttEoB5fSk0ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B4flvHQZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zm60xz2b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B4flvHQZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zm60xz2b"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TF8TIk3066978
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 16:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AE7tUJMeByc
	QH5jUTrg9HLnidqspvmybbPI9mAEDiXI=; b=B4flvHQZoUOhFVlQ81KmQ4CNeHL
	wuoEDAXUbPhqEizeraB/WXQOXq6vScfVTBKLqKh0zt6VAJOrN0pfgcJuVJsL9aqh
	H9Xk/MuSCXWo5IxNmKqioqfNXqRrCagawE4Pc1EVc3BhHFXuzITNvXTudCbSK0xW
	9BW2QeYc0ltLq4gFefJthGFIuQFi4K1ogE0cHkpSMVWDEbDreQLbEXYl2ihh8r+4
	MuGHcJTm2queiSy8cYUW1s6HF5ejup41AfjqtTgzbxx0it4iHgHiher+NmEYxjGS
	t9ci6bhbZIxMOXpcXTJl8xxEHFdfbFOFqIE5XxVaEoBxDUXOOLykQu9mDog==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du7sxbe0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 16:15:00 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95a78846a1eso5185620241.2
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 09:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777479299; x=1778084099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AE7tUJMeBycQH5jUTrg9HLnidqspvmybbPI9mAEDiXI=;
        b=Zm60xz2bA02EXB9H2Zh0Z9gdx2gDgM/wa6wT/jw3kkxKlugSHXKs2TpBrEWR/nZekH
         rH9M1NT0NYbCC70UKLBRBosHnuERwM7/WPTu6CWXZfDbe6qprD8VHGdiUYOjK+VrFU0c
         SEbCPO7vGO2O18272HojM/Al9kcql7fOt/9i+SB7GFRfEeLLIbRO1hNGEKFM884+4BDW
         7b4DCp9+LLQ9huC4gc7wmey+WfuS1TCmDEvCeq/08bVaxc+j9aANM7UgRRlYF06Sdpel
         Cl/h1GZ8rnLIQJ4o5kCoe4rTg0uX9UWAQdZpIU1+cPfB30Tc7EkVIyh8pdJ5hJc8WkTP
         t6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777479299; x=1778084099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AE7tUJMeBycQH5jUTrg9HLnidqspvmybbPI9mAEDiXI=;
        b=SiLJs/LclQXZ4idbtgJ0X857aUmx39rLL6OvRYEgeg2r1gkDL+N3AfQNakB6qvLWGA
         X45L4szAB4yf2aGpaxIIq9RdTPR9KMxoK/U6kTezO2qk8B3ZMlGMpBJZBbWrov1rhILv
         If6OcoFaWLnZisROYv8Z/8/25bGda4QSP9vaH0keH5vW6lzvH0ICO6Zuop+wzSaf0cM8
         C/eH8aDtzD0PbMMiy6sU7mKgcz4z+CfF3Qpo58MfBcCCzoS/poS90MwzBQ1V6tWAK8Oe
         jQ/YYkYtNnvmwbZChGQSHlTbDYpQPWoOMkrSJhjlMi/jVAeKlSGNpALKafR4deRA1Nf8
         upnw==
X-Forwarded-Encrypted: i=1; AFNElJ8Ie1MuBN+LjEnMkJ6Cnh4IHX6S7WvukaNXjZw4d0GaTTKJsHc/Ibcb2R8kFJBFp1w9Z44a52NZS+EKXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww0bkz4XCyZT39RPkix6fljzQFdVMtiZX+uAmcPq0je+HyObi8
	/dMomfddsRNlJszoID2p9tHtwa5LGTAHk26kZ9OSnZbGYFnIe0njDwA87xUpS5KhDUo67gnJm95
	gGRAFVlCBR9MRudXsOtFjssfZ285Ch6v/8Fm7yT3kUAc2dmhf7sYY3qzHj5bjWSI7Ag==
X-Gm-Gg: AeBDietcaCgxZpBzT3BALoqsYyhms+5QerJ2vgcLNZRKZO4GGyuToHjgINcG43bQkvI
	dsxh7DArBpRpT/VA5LwI00hZ8sAsJrFgIQ3zKFt9sDNFIXXT8pLseN3OfArt12VrqrBE2pZUXUU
	LYjdfK/gDpF8jhW3l4fOCIIyzqSvxPCPDMiCGEEg60ytryJcSuHo5Y2dVbxw4HA6wfXJPbQPNZC
	q9MNXdFZ7ChWdBIc/ldJEVdkr89VMST9Me4CL7IAt9F4O5KtM7Jipzy3Z2pIYYW3kCneeNbt/AB
	5Ch7UrQ3uZG+0GNDVIdDdrGR88rU+bgN73O6vFzYgpAepg9QG8VtDsCpPXXsPR2E73AI4hWLFXK
	6gXO8MYqmEe3uEopBRuohTMEW4ChM5i078zk07EPafgqoqc3qtQ16a89nUEpC
X-Received: by 2002:a05:6122:8b11:b0:56f:a3e2:66a4 with SMTP id 71dfb90a1353d-573a554f7d3mr5292042e0c.1.1777479299465;
        Wed, 29 Apr 2026 09:14:59 -0700 (PDT)
X-Received: by 2002:a05:6122:8b11:b0:56f:a3e2:66a4 with SMTP id 71dfb90a1353d-573a554f7d3mr5291995e0c.1.1777479299064;
        Wed, 29 Apr 2026 09:14:59 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed659dsm2438525e9.2.2026.04.29.09.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 09:14:58 -0700 (PDT)
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
Subject: [PATCH v3 10/11] thermal/of: Process cooling device index in cooling-spec
Date: Wed, 29 Apr 2026 18:14:23 +0200
Message-ID: <20260429161430.3802970-11-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-GUID: j6JlknJCJ3jLUqO4NGI1lLPzs-gmtTlJ
X-Authority-Analysis: v=2.4 cv=eeANubEH c=1 sm=1 tr=0 ts=69f22e84 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=s4Kp2nOrnj-iCWvMcIQA:9
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE2MiBTYWx0ZWRfX69OWeWu6k6c2
 UgJFlox5wbVrF/1bJnt89i8V6kpaGatLOohaHH2kbFGvfAgEk7PoPeFkFkXAxaiMqFoglg9OEbl
 u/PBGU2NrKnUJZm4pAj5G8IP7iOjp4TTqkhDh0v9CjUG6xwAproOyn76CniF89oIyV9poEjL8QQ
 TtOLhanIcMfcDeVnzGvIFnqTwT8hBfg/xUJ6nBK3So86VcuGRxdHxZV77NFrbE9usXfC6DjRfTf
 HUnzYyOsemM6ikz8UehDgwvRRsEd3ArJ2pH5OqvIXpdg9RK0MjYIz2kkbLha0z55NpAnk2t3baD
 IHsSULJMSHTHOjq7e626q6zmVwIlPLMfZhlki44NhrMdd/1085E8s2OabOxkkP65p1VQwRtlAQK
 X871JO3rdBKIJ+a0X32jvMIQAutJr/6AbG1JW02dGthfnYbWQoufgPGfs2A67pQ+HBDdO9Rvksv
 7KgkFPhzfB89HV0dkAg==
X-Proofpoint-ORIG-GUID: j6JlknJCJ3jLUqO4NGI1lLPzs-gmtTlJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290162

The new DT bindings format describes a cooling device spec with the
cooling device node, the id and the mitigation limits.

Depending on the version of the DT bindings, in order to bind, check
with the device node pointer only or, in addition, the cooling device
id.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_of.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index c9190a03993f..1c944daebec3 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -259,16 +259,34 @@ static bool thermal_of_get_cooling_spec(struct device_node *map_np, int index,
 
 	of_node_put(cooling_spec.np);
 
-	if (cooling_spec.args_count < 2) {
-		pr_err("wrong reference to cooling device, missing limits\n");
+	/*
+	 * There are two formats:
+	 * - Legacy format :	<&cdev lower upper>
+	 * - New format    :	<&cdev of_index lower upper>
+	 *
+	 * With the new format, along with the device node pointer,
+	 * the of_index must match with the cooling device of_index in
+	 * order to bind
+	 */
+	if (cooling_spec.args_count < 2 || cooling_spec.args_count > 3) {
+		pr_err("Invalid number of cooling device parameters\n");
 		return false;
 	}
 
+	if (cooling_spec.args_count == 3 &&
+	    cooling_spec.args[0] != cdev->of_index)
+		return false;
+
 	if (cooling_spec.np != cdev->np)
 		return false;
 
-	c->lower = cooling_spec.args[0];
-	c->upper = cooling_spec.args[1];
+	if (cooling_spec.args_count != 3) {
+		c->lower = cooling_spec.args[0];
+		c->upper = cooling_spec.args[1];
+	} else {
+		c->lower = cooling_spec.args[1];
+		c->upper = cooling_spec.args[2];
+	}
 	c->weight = weight;
 
 	return true;
-- 
2.43.0

