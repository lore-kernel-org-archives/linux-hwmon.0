Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2034640B6E0
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 14:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186736; cv=none; b=YJXOVLhsv4hvYrfHYnOFq11RfbbMdSusPVDzlnDISrayps7zEDOaJV4ELJcyUUPiHuHlMlmQiFY24l12JdDLda3NDp65elnPZ7196lM43EPGrZE/NXqBGr0jT9wZDS9/cvr3+gvS04JvSe3WpSHKNKVdZA3LsLsJXlh9GC5sx58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186736; c=relaxed/simple;
	bh=cnmPhElCTchkth3Ndc+hQDCapDaZ8GQl8BWi+yVn00w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VvipVi2z76cX1olCksrJcHWioYLnfW+flX5AByHuCA8dWcKSzbwbNsrE6i8D2iCb0Dfcrl0cl9HqsBX2W39swiY9PFLo++2MQvctSD0soK9T7a+CyXJPgp231qJdrPgqFAmUY2dDTBVCJ93yu7OceMSmaqesO5oEeg5Mx7KTTgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YTD6mq4m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxopFWul; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YTD6mq4m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxopFWul"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BCTJWn600984
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 14:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUbjYXUbqTMzIFkJjml7ONlkKsWs7fQp6JNxTiTreUQ=; b=YTD6mq4mrxS9r700
	dr0Xg/ypFRHLhKAh0xa6EQP6J4dLJY+odVzne+36vxt44BJov9uumgvV6SDuGfOB
	suct7j066fcgmhCbX21alTW/miQmW3Eb/FbnnnXQxD5ynjoLvcVeHugydMZZZH0Y
	PS8w5Yrj01D0YIC8X4/adyhAB1jfE4UpE+OrFlZ5cy9seZTaaYtp7NOSiFl9CvtO
	i0wXsxCMXFbB0SmBQNJghLWJA4lntPshITWt7LXdTeMINAxM1UERIOp3TyBL2VJv
	TqrHnbdbzB53mfMKV/bBTFNDXO+EVe/3F78YhfAsoCLRb6AfpTjbrpSjYhHPAl0E
	OAUk3g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u3ruj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 14:05:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b982ec338so9228072a91.0
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 07:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781186734; x=1781791534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUbjYXUbqTMzIFkJjml7ONlkKsWs7fQp6JNxTiTreUQ=;
        b=NxopFWulzdYVyyPcb+ygTOVmrIp0s+evr2iMdnU4lDoxiGu++uK5ijKnofX3O0u8zE
         cOS2T5BCc4sMTegrP3+swt1FE8Kem4m5Gij7HZ6yv3nfVZYi1xWFxJjvVx2FujXpVk6f
         Cnh+TSXRKl9fPPQAlBgAWKwsX0ZP/VhZbvOHV2I+X+9uywlRI0ghHIVkW/TfF15Pn34s
         hZrqEJz85RVwA3K6Uw/4VQZFbNW2hB4j9/M0iK2mZrCVPL/U4ExybgHqVFeF6dEqGvyw
         tqq0+c4bxsI7ONgXFqljzHAjq0Po7sgzHnRT3mOevkX6wAw/U1Hsa/dFpOdzPNXAzt7e
         rUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781186734; x=1781791534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KUbjYXUbqTMzIFkJjml7ONlkKsWs7fQp6JNxTiTreUQ=;
        b=QCmj4GNMqkwz1kWXBrpaFr8gIE80FpUa5O/sRK1aiOBPgngCB222d2iV028RiRWv1g
         yy5AJmFDwZaE+zqBR9obnRdPTa6wNNhCXaSgdXcp3QKBL8s9mXgOXFGfMhRDNXztSsVr
         nLeC2ZOUs5Derpisnwxhz0hPFMISWI4ynp3aQ+L7RVysOTtH/xyCKTKSYRrbFmrCribL
         ZPxfoT7LJVEVTzgSe0eaMdogt45uhSiSa+3Bh/LmMNYVZtqKKMpIB3mkDI+rXA+9RHTc
         e22Y+6dcimN5D67SarY6qBtrp/O0OMDBQIhyUU9mskoRl2h3ucmGNLS6iHUKTawn+y0k
         xsdA==
X-Forwarded-Encrypted: i=1; AFNElJ/3g0rRfHe17fJd04dmprXfzPo6XXMCQVOTbprs5ggTDBUuzgcGGBnicSnM6Q7vL2u3a2JAPoTiTdpj9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfGzEzt+AaFDOwo1yRCHF7gCEJvRJmkfHMzSnJnYhbgM8LVPuK
	Z7AnLe//b5aHIt2BEI1EelqZNL69b/mjV0/fh3uQYvT+Et2E8G5JKMqMEgMkrtIS32Nr1vlY4VI
	q8aztBCu6LeULnVgZDIYTXbrkkDGqu0huFhWX+XubVsaa0CmjSQOKL/fod6PXvbfLAQ==
X-Gm-Gg: Acq92OGCKKNfzx9LnbW0StM3YsDYGN4YRxBIjsYTL1CflehVTy6jLM/hpV5nckQsXje
	nTTGPL8kei7f6qxErVx/sySWfMNvWOcszkQVXZA8LiJzpG6rF8xws+kHxEJL/SEYS/FYow5elgy
	mzWf/E1/fog6LFXR29o7LMLy3W6xglwTBw1Gpuqor1RPpVMUr2EJX+ODETJ01qOcdTlZimvn2ru
	QdJ1G5slIMY1z7rj/Ijot3gdJW8bPSESr75miovcMbiUOFIU6pVLWWoekH4v4sDHKREhkb4XY1z
	wVu3sbbnXZyzTVVIDanvaW5KEyNw4bLn35Ryb2qZVgz0RErpVSDkSl3U6D0mHJWE8iak5IN7Cz0
	OKKTM2IWgkKgJOAZqhOL2lHRd2o0Q0rT3jNaLVsiUMiCrnsyEJojh64wQRWua/Y7gH7wKQHC/uU
	ciOjbTknPXq2XXl3mRBJLN0h8NHODvHQKQCm8RTRk1MN2yu1LWw0aQ8byC2sJlSc8VjCIf9IV59
	quHV5pY2h6O
X-Received: by 2002:a17:90a:d2d0:b0:36b:77b9:5c8c with SMTP id 98e67ed59e1d1-377a62a4557mr3298446a91.17.1781186733832;
        Thu, 11 Jun 2026 07:05:33 -0700 (PDT)
X-Received: by 2002:a17:90a:d2d0:b0:36b:77b9:5c8c with SMTP id 98e67ed59e1d1-377a62a4557mr3298357a91.17.1781186732922;
        Thu, 11 Jun 2026 07:05:32 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2c810sm11133831a12.9.2026.06.11.07.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 07:05:30 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 16:05:24 +0200
Subject: [PATCH v2 1/3] dt-bindings: hwmon: ina2xx: add ina232 compatible
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-monza-ina232-v2-1-e4375ce652d0@oss.qualcomm.com>
References: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
In-Reply-To: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Martino Facchin <m.facchin@arduino.cc>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: URjKQqcPzpFM7PXovkqdDswfoG6HPJtP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfX7do+/BoOAy1o
 SfYgvpWsQFtkRjNOIwGNEHns/pNExmBDkZtrhnTVPH8mlvFvOiwpvZabxiatcrdl6N8mB6oErX3
 UTmCMUBISsMDgocNNDYGM3VdX754gbI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfX0cvl4TOE6NWN
 WG+RNGB0WzVocnAAU/KYLMzDQhdIdP90fsKUyPVfx4GUfSamz7bg+0lc7wOIGECbVJFPPWnl784
 qfr++PpltmFEFV3PTQHBwJ1eptyPdSy6onkCfT0TlRQVaezb6yuqMz5wKbuaHq99bESbniKwNCz
 apeWzIdK1PmYtmoRGiHVPqc6pyNgm8Z/BTTZKM7Z2Ubq0J/HnkxYzMPM43kVkTSFtjWgr/6B4ds
 B+1fZNby+7T1SzTmNFe4FFkxeE5GGjr1uLGfAGPw09Kvr17uVhLMNe43yrcWZ4+pMb4VkQcHkla
 SK2+Q+2ZlPfJ/olWwCceJE4FXaLUMKyU/lcBE/fi17p7uHhrF84A1x0kG96OEBBSaDVBYuzue+i
 hp6tqEG7HEEjUx4DnxSchf6w4+3ubApRT2sBo24s5Ct097oMM1F8i8t28UKascaoy9cHsNipW+h
 85juXYGyBYHyPQ7XDkg==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2ac0ae cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: URjKQqcPzpFM7PXovkqdDswfoG6HPJtP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110141

From: Martino Facchin <m.facchin@arduino.cc>

The INA232 is a current/power monitor from Texas Instruments sharing
the same register map as the other INA2xx.

Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index 009d78b308596ca795bebdd160431bd718b127e0..a79ade3142fa4f36f2ae4655bbf0db8ad84ec13a 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
@@ -28,6 +28,7 @@ properties:
       - ti,ina228
       - ti,ina230
       - ti,ina231
+      - ti,ina232
       - ti,ina233
       - ti,ina234
       - ti,ina237
@@ -114,6 +115,7 @@ allOf:
               - ti,ina228
               - ti,ina230
               - ti,ina231
+              - ti,ina232
               - ti,ina234
               - ti,ina237
               - ti,ina238
@@ -136,6 +138,7 @@ allOf:
               - ti,ina226
               - ti,ina230
               - ti,ina231
+              - ti,ina232
               - ti,ina234
               - ti,ina260
               - ti,ina700

-- 
2.34.1

