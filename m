Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63101386571
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 18:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783363643; cv=none; b=ErV3m4fTSbrSQAQG9R7mijwRjZd4IY5qUoO7iIzWSQnyzHVbHX4j+TZQ6y7Q64BBfcfKqg2/zwuD3BOIUfwzxEXDkjSudzeNKbY/FQT2HjdLUn1YvTo/kSh7hxnaQN6wsJiYiIngfIxdeqxQUrcn6ecRWzF8XirdhakeE56fl0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783363643; c=relaxed/simple;
	bh=qL9Yfw+uc5wo1DAwxzgU/wU7crRPW50fgGfVTdimoUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=krEmuk5+VSD4qQE1z5MGyG9Sr0i4W77VB1XPTjS79chTpepVVAaf+fEkRyxSKwyCHK3iRDYnoSyFgXowTjz1UyuQxStd+6BRuZEEhnNviMdh6YZ6HlY5IqipJm4vvtPHBSFr7OL//jCR73ICRlYGhjxqvT2E5/AZZXu+3okLub8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VlLc2xdd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=br91QniJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VlLc2xdd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="br91QniJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFB2v900892
	for <linux-hwmon@vger.kernel.org>; Mon, 6 Jul 2026 18:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EVhvcgnKY9L
	yRKg+mffxnRd38kGleBy0v6Ff7TCPbc4=; b=VlLc2xddVMH1DBuG7s4kdeTIyoP
	Za3yAMH+EL2nFHRwzCF69oo/wQ9MuFIdWpHteL/m4KWzH33zEfYBzqpYW6PkLUtY
	NilSAJ0e6OD/JtLPYKrPE6U1HniJ59IGn9CpRV7va2FgAunPXhHlqn1OtdoE/W2a
	UqME0Znd5dky0XsBOIMQh5G8Omv4Z+2nCDWYCxE9A4O6gQvm6NH5Uy2kghnhqVVW
	e3lT5l7O5GhRh7D+EpyvhyXm73Cr7Z3Ga42/NI3gVVfKOToGBRwwzbdXaoDNw47A
	TGIemXWE8E0NNYp6XN2llYd/CnZrHrP9vGI0JXQXbAh+VzavWw2MnQjOmhQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7k1r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 18:47:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ac0a54110so382193385a.2
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 11:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783363633; x=1783968433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVhvcgnKY9LyRKg+mffxnRd38kGleBy0v6Ff7TCPbc4=;
        b=br91QniJxRD6R7C3gB3JJHtw0MHvO+UTPL2L3A8GseArWM485ETQCqtufC6mf8Y7we
         5XR2cAkkChV1hYgjCRewy/UxDKHfCw2tA7wfi+tYK9Ijhzk+HmnIDI2bQmM2f6ApA6hZ
         Y85i9j9vI40vCdHmteSt8d/c/4D5zPa9qduo9U/k4UIbopQBImhjgVV5op/Xb2B5GtHD
         esGQy/olIkxfvTzlMIjqqkV7K1okBxXW86FfeMSZh2nM3N8wwBNzAxDk3eO9VEZufMsI
         NxxrfQyTIcFuiQO4j8U79VYBTOx5QK3POv0n8Lq+g0/Hk3kvUI12M/C9itCzvWeaQDwi
         ciiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783363633; x=1783968433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EVhvcgnKY9LyRKg+mffxnRd38kGleBy0v6Ff7TCPbc4=;
        b=eZhxF0expyhqPatH949C9eDG5llk/fAM4Q3NYwL/H7Yzop+TngZxprNRNGwqtb2Ue0
         /Ux2ouCbOTjbO31jRKWGvPhDlKYbAPyuOYchOC44J/5MrVY1nYP2L+uJKRF+YIk6Cgtq
         BpifBstUBC/BZvaO9wkucz960omTFxaBUyW8WUssrFEXcA8LHshyVvsLEDE2pJozxopj
         kAIIM6DN8nnQGZ7rsdEf4DMzHt0Yr2O5yfsF++nhHONSaEnWxJGjUOAn58NQEAIAFK9h
         3EpJm39B51XRNmwO8rxuaqbutDIO7hJXX1794EKrVIrr8pXbf+J3JM2or1d0RjT/84ZV
         8BfQ==
X-Forwarded-Encrypted: i=1; AHgh+RofMLJ3Erej3XrG7gVx6ZpM7XgKUKdjK/Y6LIwaFBF/47oQIdIk63QMJCmB6nH5Yo7cGozMZoJq6OjtCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy//J/fAJdXYEXafnyNtzcOY3pKWEzaee7GiIC5shkyz1Fz8pyw
	Mlc/l2RhJkZqo3Wn776VCVumse+E0f3RzBrbmXmZldwFzjYlP1Z7WxfR+jdbGTDzbnDkNvM7xmo
	Ol+rH+6WbgdWqmYW/l/lC5Ob/G8ste7I5jcwk7he+zWM6cyuWHd1Xk+Og4YLfVhE1WA==
X-Gm-Gg: AfdE7cky4cwp1tq76gCgUzA+j4S4Vmd4mbQYOXxfhHO0eGSQ99FZ2kGc/M1AMmD/jXu
	v2SrGbWhSs7hgehjzPPdq/4vyqnX2kOPKpcobA/04BLO8abzT5dUI3/BvhOLNU0X+L/yTyWo1/N
	QIoi7OgPnFG9PaolcbT7vSiiH45nPG1B7CYjwOi5LkrPsYCjADqWmERdJhZIXqhslTgOSMMxrtg
	F+X4Oy+SIQ2I/GIyDg15MORTlq0Qig7pre1kWjaBCWkTLL6SdBpjlzE5VI0egu1cJtRx6g9LGkJ
	cP7or0Z4p3LybnKRgQsoyosKexmDTP3zTXqfuY1NKpSJ64H7Pv/xXif66ppfJVM8Wv4Rc+gy5oA
	PdmrpOixmfwEBtZvTDTxC10deyoyT09Fh4vKVyTTpwp7x6g==
X-Received: by 2002:a05:620a:40c7:b0:92e:4a4a:4478 with SMTP id af79cd13be357-92ebb575ad4mr257500885a.31.1783363632924;
        Mon, 06 Jul 2026 11:47:12 -0700 (PDT)
X-Received: by 2002:a05:620a:40c7:b0:92e:4a4a:4478 with SMTP id af79cd13be357-92ebb575ad4mr257495985a.31.1783363632460;
        Mon, 06 Jul 2026 11:47:12 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:b077:843a:5587:be05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d56sm3858625e9.8.2026.07.06.11.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:47:09 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v5 1/3] dt-bindings: embedded-controller: Add Lenovo ThinkPad T14s thermal sensor provider support
Date: Mon,  6 Jul 2026 20:46:46 +0200
Message-ID: <20260706184648.35613-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfX3x2QHKvBoXqJ
 9ZriSRDy8X1wt6BKC6MQPY6Npzq1xe3OPZedfogu2JWECbyKEuS832fTwCVK97v6Wuw1yulLQKN
 yox1PeZw4L5uUKdwmcWUfTdlv52UF6xkDLCJrVlE0A4ed5mMx/ZyNhjKY0aWLVQq0gE1FMG0ClH
 ADZN0TMWj9oCuBfeR9i/Be3U8CPCSx7zTccMRBTtTHpI72XZzgzQ/C63YIPb2JG7HC8XA4Iye76
 UtAMWf3GPmHxrhjWkFYxYrS7d7e4QZd4TK667pOWkbNMhmxZ3Tlpw9eKs8y+yfko362GSD9FSrm
 SbBjUSSecWzTPVktTzDhD9/n/DK82r4fvE+gJsR2LVBE+WFrimb3wS0J8S81RwBMpAEbsCynntO
 uymqFoIhb3WbaWFGq3iDA7yUOUeBaEF74Qe561dBPUxtEoUhHOF9EtbQEfnClnsXaLcSNATAIpf
 n699jYRK4NMqZWf5G1g==
X-Proofpoint-ORIG-GUID: Zg9lzGNs1NgWSNBS1gTFTG5qxxCc9Q8f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfX3Rerwdi6zYhs
 146gqNhEEnIkdhYYtZ0ZELiGMu4skLHJd3GzgBgkzSLfx+gVXn66LUmFd+qTO2V69lNim2+O0IP
 HTWHoED2vrGYy6oz2jWjVp0GcNkblBc=
X-Proofpoint-GUID: Zg9lzGNs1NgWSNBS1gTFTG5qxxCc9Q8f
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4bf831 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=s6oxFZdllmZqp78XS98A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060189

Document the Lenovo ThinkPad T14s Embedded Controller as a thermal
sensor provider by adding the '#thermal-sensor-cells' property.

This allows the EC temperature sensors to be referenced from thermal
zones in the device tree.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../embedded-controller/lenovo,thinkpad-t14s-ec.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
index c87ccb5b3086..0d049979e35b 100644
--- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
@@ -26,10 +26,14 @@ properties:
 
   wakeup-source: true
 
+  "#thermal-sensor-cells":
+    const: 1
+
 required:
   - compatible
   - reg
   - interrupts
+  - "#thermal-sensor-cells"
 
 additionalProperties: false
 
@@ -45,6 +49,7 @@ examples:
             reg = <0x28>;
             interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
             wakeup-source;
+            #thermal-sensor-cells = <1>;
         };
     };
 ...
-- 
2.53.0

