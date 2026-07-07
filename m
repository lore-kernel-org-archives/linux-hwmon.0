Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8336397B1B
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Jul 2026 19:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452161; cv=none; b=XZvPM0+gQjulrVTEo+iHExbPxEj+QWAE7VSEJ7rSB3f0CK6HGSbgb2GtSVbE/I5KUpm4kNuYLKxwB8qRzdbNF0GTZMeBtywhTx91zhWYJicm0Bf8d4nFX8c2B5FthrWxClXgQ+EzGfF10rbGb/svg/tE0nLMF3crCACWikaiJJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452161; c=relaxed/simple;
	bh=1Fs8N6cwVTIWmqFAeyUCV1zMsM4ASCH5uF4rAKhciGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CIX9oKYOV9CugOrk4mdJexamzpkKHEm0J8FUJcmrtWh4EWbZUazLYybYKm6OemmRri8vcLpgvVnqfHbd4ZqPuQLr62l6ULC2TehQ1ZVOEHSo2B2i+EfTvsQ7EyPBvd/uzuB0tuF3mZsLKcBG3TY2vhQdwx+YtvBvEY9+nGv27xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aWLEYor4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayvj4HNZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWLEYor4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayvj4HNZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5Ysu504910
	for <linux-hwmon@vger.kernel.org>; Tue, 7 Jul 2026 19:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=l75MTQkX1SP
	NVbC3FrGgp64H9ib1BWH42DZHDWg2If8=; b=aWLEYor4HwInbMYms63/SrUsl7J
	evpOBhxgeGOmRLJ2H2oyR51YocdgARUxI0SEpYspZbM2xBOBnOu5EGB5O/+YMQz9
	tMiXTz4DWsd6k0VSoycA6Z7RKEWOvMgf7sIvUcgFpcJLjMFTGaapXCH2mKxDW1y0
	4JVTyHXJRThnA2gieFSKRVcpmMDP03+9Irgen17Bd38kNeyHalFufDXitw8ORvVg
	N2MDnD2cgLByI3eOuyfEXsm5FRRul2VihM5TdbODfBl7bGYzl9ApjydQyyTDti9P
	IMZhN4xnMW8ZzCYygJqr8221DmilU3UVqLmpzUM/13vEZ1Gbh3zlXsWqVqA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vdjb8eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 19:22:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d137a68so105338671cf.3
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 12:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783452158; x=1784056958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l75MTQkX1SPNVbC3FrGgp64H9ib1BWH42DZHDWg2If8=;
        b=ayvj4HNZxZSMp5s3w1aPP6I5zvfGv81bUtq1lH9lDKMR1siOaj9TJt30R275g5oBwd
         sw95KENczLEjudrhBJCeT4OlnP5KCxET3bJNws2uSRlXlb8woP1jbEgPLM/014fOvyNx
         kDOOyB4/1zCqipbChKHcrDCCrWFfu+l9uhitCt7qQ1DjyRTzRtQeoEY69umrJpxI64A0
         5sw0uquDMfllwVNYczui94C/lXrbcrYvu4qYmWt4lkijBojvIXk/cWVpUpo4y3+vUchO
         jhCu+UxKDzs0cANvK3eMmVuh3q4fbHvqQIhseYoJLWrFmQqTVjDAiIyShi7vFZy58qWl
         20DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452158; x=1784056958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l75MTQkX1SPNVbC3FrGgp64H9ib1BWH42DZHDWg2If8=;
        b=V+cJtMxg7SxIUazAp4bg95VugSo3pHlbOUPcXIS6GAQYNsJleIzGfZoSw/55NdA1KV
         wyhksP8qpDLAy6y3qg4x0HjZxqBGN+0UZiksjKiqNPwg5MfXcHxS3m8kpnbk3CRMeatr
         E6uFtBL9UNf32rlFl0+6hFWJIU/ZiZQ+a7RNEUiPS8yz6qmdi2ZMkcGX8nj+6ql/Umbd
         JNCGgnyS5h+UI+4tQxBb6mxIMOXXyIWpIEC0wuq3/G5E2KFG8LPGHT4qCtP9yg/MTvZL
         66tMGesfEOguhLvaxqyKGA9JfnhL4HWoZch6GRKvNLsaV23cDhe8sFZ/J5wP2jx2kvi5
         eEyQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBVoX0lHZWlqmQTP2MOGSSPP1EPCJ2aHlPwrevuNPeAsSyhGVO6Y1wDsc4t71X2TjpY+0JrR1oV6ZyFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2AsTqHhPu9v0MOZd2Y5q0MhBqRTRi9EhPxVRnHk7rRJAbsmXI
	JWl1/0HplKbJ34anBp9Xe7VjdG/DsODmvmehQKJdC+A45Kx4B3S6dHEsuZOpZnp63U4znHTEy6Z
	MxUIh9G2S8KGPzFyNs793lWcWwzWGy8KoteMI7vLAh9b42edIqTsMnbM6ucnfL6RxGw==
X-Gm-Gg: AfdE7clU0spK/UixHBuLiu9jg4q+sGUwemvxTRzp936RW7HMP58Ql0IDhv3gjngVcOk
	+eTGawh7WjhKM8AieHvW0dEotaiThH/68gyVLy4hIfQGIMZwviwzkDvAVao8tgE1gKc+PHLprQh
	SWWF2AFimMTAE1AyeGoAH9BXqYILNiOaWLquiQNivIjT4cprWk4mzE8wx6/qJJ6yVluhsAZE8Jv
	k4bOxtzZa7YteY3bmsDf4pWPph0bpeh7HoJqOjwtX+oeu528LxHSNMNQVP+790qC46hMY7Sba8t
	tpn/hohfEmYSgXRxMIhKFDKx68uu380iVw1n0CAx+6qdsPXTXCp4Q99K3WmuzN0XFietX+jrEkp
	BP6yJFGUT9oncZeTUkMDaCrhbDZ8nm+saYMKUTRveuOc=
X-Received: by 2002:a05:622a:252:b0:51a:8c9a:8fad with SMTP id d75a77b69052e-51c748af94dmr72269021cf.62.1783452158053;
        Tue, 07 Jul 2026 12:22:38 -0700 (PDT)
X-Received: by 2002:a05:622a:252:b0:51a:8c9a:8fad with SMTP id d75a77b69052e-51c748af94dmr72264601cf.62.1783452152846;
        Tue, 07 Jul 2026 12:22:32 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8029:bbc1:63:ed84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3677asm70025515e9.4.2026.07.07.12.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:22:32 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v6 1/3] dt-bindings: embedded-controller: Add Lenovo ThinkPad T14s thermal sensor provider support
Date: Tue,  7 Jul 2026 21:22:26 +0200
Message-ID: <20260707192228.14647-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=6a4d51fe cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=s6oxFZdllmZqp78XS98A:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: bmemShtClo6RmeGDEysMTC20-tOMu2tm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX9Xt2UZjCnS1X
 Lh1ZCxBYrCD2IXvB5le+X2rBO7QV0R6Rkvvavy6W7iCIYKqyiy51g4rZNVsDfNrchHTBLAy/PzO
 ZGCZdd/Dl23TpI0htxODA94nmwqjqoMdW28+cbm7lBFjn7k2tFxn8kW8SR1rT62nHOunbp5dFb3
 IxbWhtJiqYe+i1StN1v18uGYzWqgyLL5MaUsNTYF42QU31Rz7vzRqZ50rNWLdnrofrwx9jycPmA
 Is/Z3dTgirUd8Hl4t5p7WIp1toYBP1ALo3PWjy6ibjn3SzNdZhNj4spBPIYj5iNM6q06oeyx21h
 +cJsfFyJvrZL/AuBozwH1VH8tppHIIOA3sV+cdYN5gp8R5hm++Q5281Gcl4wXLc6oKuCve2/G3w
 u/J5hZxtoqpYPflgjCsxZ3Qb+emrzNraH7O/IQRLgibRg1GBVCX85MYVf/KRhZ3a+sW05PahJpI
 JlrLSXYm3WEWT5W7F9w==
X-Proofpoint-ORIG-GUID: bmemShtClo6RmeGDEysMTC20-tOMu2tm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfXymzeQK25iFbP
 qxzGCr/XRsxkyyubvaDmWbi0m/VQiR/ie4iOXAwaKeL2qSA4DHiEzYxm5aisMwub7lTnaxGCN99
 8Lve5qTgBXiOSn8vY2rC+aNzom+M0V8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070189

Document the Lenovo ThinkPad T14s Embedded Controller as a thermal
sensor provider by adding the '#thermal-sensor-cells' property.

This allows the EC temperature sensors to be referenced from thermal
zones in the device tree.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
index c87ccb5b3086..f677966b52a8 100644
--- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
@@ -26,6 +26,9 @@ properties:
 
   wakeup-source: true
 
+  "#thermal-sensor-cells":
+    const: 1
+
 required:
   - compatible
   - reg
@@ -45,6 +48,7 @@ examples:
             reg = <0x28>;
             interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
             wakeup-source;
+            #thermal-sensor-cells = <1>;
         };
     };
 ...
-- 
2.53.0

