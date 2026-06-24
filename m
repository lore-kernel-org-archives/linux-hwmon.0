Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15043E559A
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Jun 2026 21:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335328; cv=none; b=q/w+qWikJ1OtxyUunN9AaT03/PdpJ5h0b4KSsU+cFu3s2gZHPIdpmh2fwrZzGC93/moN8qJxjfcLTyl2aP9Y9qIHfbP0898H8esvq6LgQzOaTxOOOKtqOMobhz9axk6z7GraSwr/4C+ws4cFwcvO0qgEwLhnTVQAB+RnCo27Phw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335328; c=relaxed/simple;
	bh=Pjwum7Mu37SGUsunaTWf37R6DFsb2jzx4XAajClW+OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i5WI8660ECp0dQJ2E6PPa2fyTG6sZ3/LlUr/dgjnkJzhYrvKzounPk7T2oX845Ce9l6LYSyu2VseKMelPxbeTbkYAIolikyFFHYzRwnWxcPzTlzLxt+j5jfmjYx9X164HrqDSlyL97PdTTx3xjYlJ+PxhE5fDVSzmKqjPjas62g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0sSUk6Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xt/+3sIA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0sSUk6Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xt/+3sIA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJjgNj185047
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Jun 2026 21:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NF98u5m0GQQqjMpcochC97YunhtCfm5cQBU
	9SMM1MoA=; b=S0sSUk6ZPVpbTTVHkgCEqN6NrMf86QEsRvckN6CEFqZGTWSY7bE
	SatDPG1P2jUm4JortNy62OspvSrafgfp3ojHAVsdS3yrf1YHhlNg/37a/J6FVkBW
	ald8d97dEZg02qXft2Z0Aw+qoCAOSFP23TEndFxtQhCd5AZbPTVcZtbcmVM/+/5l
	ailHfBe35IQfwLf/KL/JU0kx8iHGfp9oSQ1uUFsJ/7n4QZ2ebanJ3sXwgO29RzlE
	kDZs8sxRjBYCMXd/HGtJk+WmlujnXxhrvKQswQrIKUXi2GiJZjGnBKe2WetBNmcp
	nDOoD3d7FPbycoelp7536s7jStneujENitA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ajm923-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Jun 2026 21:08:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91e59716176so181860985a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Jun 2026 14:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782335324; x=1782940124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NF98u5m0GQQqjMpcochC97YunhtCfm5cQBU9SMM1MoA=;
        b=Xt/+3sIADniznDJADTMCIyylipdPmXItDJA0ivWXmTM709Rz2OZipDKJHoMTSu9vj1
         v5di1pbaVraQQaWaYzBPV3fjjhlyf9YoghcoP+QVo8RefRQ9jNDf91KGwyQ8ZteJY+BB
         Ydzvzz7lMtzN228Y8OEQrO3x7iEVKojgIvup2xEOFrz4GwXbZEnuHoQnUBqCS/t82nFG
         SyTXeLcPvkWL6hC4GWTZnQBEoJvPp+06H2H5PVcX9tFqJEyte7tnoOJmEkj5vtjA9/gV
         SH77Ehgk4ub3UdJ9F6UyqkWeivugDFu2nC8zaVK65GEnn1ZdVLr9Ts7WF3KAHXul2yhm
         a3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782335324; x=1782940124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NF98u5m0GQQqjMpcochC97YunhtCfm5cQBU9SMM1MoA=;
        b=s3UQUdgWkRy6VXqI00z7H+/921Z1Vfd9gzs+xh+yQfz+DjjF3zuZJZHrpfNSVfC6Jx
         x6qDFS/XTpmiJ+/TL1pv1xn+deiy/5nepWBJPPiFhJQ3ArP7qU5vyy7rFM4W56kGEYbE
         MlKdLqmEcPncHAUDyl7D8kGMHjv/4wJL0r5T2t3UPQppHbOWT6MFNxJh2Ug9HBVBb7uB
         gNj++38ihr2JLXmAg7wzNewkymlXuTmfTLaUmZ5XGJG2xSZrG7mcgK7u85/XmZLTO5BQ
         CUhn05Oh3Pu4HOELe1qtOMahMLBGzb671/SkHJiLdNi9JscqLHyyw5aqIO5w8RtsFROQ
         cIAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JtbuJ3g6rJQ1PWVWl1OkvUrgMoVF6y0tHpg4JSchr27rfcQ86alrxenyW7tTHrd7cr+iawSQ1b758ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwXnKGm3uJAvnokvyVWlChdKV7vcqwDOHsGDz2Y/vkW3aIlVaA
	+OTMAi+efFfKsFxb4l7UHwMS8O+Es15bdaVhAPFg8KtWsW8HLBTdaF+ja2ohrnp0wvylFqR0M9e
	tGomjb6cXQ5aNsIlY8EEZ58lNxOM/i8NGu2zwsCLR7/Hz5JWDwDGpBHdI+YNsV3m/hA==
X-Gm-Gg: AfdE7ckUvUtxX3lOvlufgh5iwE8ICFfg9PEg3o3SJKFJx4G6i0+ZApUYn6EwYIPcvJ4
	3eOzwAcdDrWd2CQvLkigDD6HW+8orEnhPX9r5uy4iO2pZngDSuyQdd+VVNNmsDxuf3qL60f3IXJ
	LH8fSA1yPGF9hbUS29SViIjSMb4pgLghNzyK5EbF3BwTE5d0Jg2zGVoQUIt9m49hdThi197UQd3
	8K2H/GcidSHWhooPKRR3XZBrDIftvDAVlo7EMIBhX3SuiYRfs83AKnZ1tduXTfKIuYVhBLSuwM4
	X6W8inFQqSOUMJVxP2xNSwoKpIdyS9lOw7tJXGbZYwC0DNm9tYsJRRVIWGgq2mXqNWjKGp0Dn/F
	8VE+U6JfQOb2snEVXJBw5XS2s3eIB+81BbQCPjcvl3p9i7g==
X-Received: by 2002:a05:620a:170e:b0:8cf:c106:faca with SMTP id af79cd13be357-921d29f8690mr3323306085a.36.1782335324234;
        Wed, 24 Jun 2026 14:08:44 -0700 (PDT)
X-Received: by 2002:a05:620a:170e:b0:8cf:c106:faca with SMTP id af79cd13be357-921d29f8690mr3323299885a.36.1782335323714;
        Wed, 24 Jun 2026 14:08:43 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:91ef:5c1f:e854:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840efdsm9455767f8f.5.2026.06.24.14.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 14:08:43 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 0/3] Lenovo ThinkPad T14s EC thermal monitoring and thermal zone integration
Date: Wed, 24 Jun 2026 23:08:22 +0200
Message-ID: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfX3vIXe07Jj+eC
 gIm/9BZHamqa5BIHdA9MhwMceYkmZA9hY30OrAxnEkyDzoL+nKdRmFwcsRQz7ioezsud6saX3Xk
 HnBojA2bPWWoAgq3I3P+nFAkYGTX/aE=
X-Proofpoint-GUID: vduR9zDbT1eXzK0NXmSNsYWN_tqFBuDY
X-Proofpoint-ORIG-GUID: vduR9zDbT1eXzK0NXmSNsYWN_tqFBuDY
X-Authority-Analysis: v=2.4 cv=DbUnbPtW c=1 sm=1 tr=0 ts=6a3c475c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=kbYhDkqKViOJv1L1JOIA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfX7WxbjKyc0DKs
 jdKdmtUvYrzGyV8sVADwjrx9Nlvr6UHLplO/87UlLeEncwlBg/OF6zaYmWemohGQM1W6DzUt/+f
 2xAzg8DyTgbxvGYY/61v380WJUaYB2eZEuFVDY6oofWFORnjUWnTO8rM3eYIjwR/xj8KeN5aWBl
 supXh9gGTBgosY3PviJE4IdVCqPho5EVNaKTrNIF1L6NH5t2BU4/xPQqN4CkNDZgKQjR/28R0pg
 Ff3LXLZpLeQ6eh7jBFxyeHow1oKb3HtB5FdtOdiAQbN33S0zy3znS2P3IU1HAGvxW9GhCVMbXDc
 rVW1mxE1RTm9mrCghcaIEyG+1WE60zt0Dnyt+MG5EcPhZuYTDmnmgggcs3n88wxW85nJzzcj5z9
 BrYAt5T3xNLSDt1IIegumN9NkwoM/LkSsZ0CKgN/rWcmzX2c50dEA14E45yDu2MrcetOvXgEReL
 1+RhRnKMC5fB7Lxncgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240177

Hi,

This series extends the Lenovo ThinkPad T14s embedded controller driver
with environmental monitoring capabilities and integrates the exposed
sensors into the Linux thermal framework.

The EC provides access to several platform temperature sensors covering
the SoC, keyboard area, bottom cover, charging circuitry, QTM module and
SSD, as well as fan speed information. These sensors are currently used
by the firmware for thermal management but are not exposed to Linux.

The first patch adds hwmon support for the EC temperature sensors and fan
RPM reporting.

The second patch wires EC thermal notifications into the hwmon event
framework, allowing userspace to receive alarm notifications when the EC
reports thermal zone state changes.

The last patch exposes the EC as a thermal sensor provider in the device
tree and defines thermal zones for the keyboard skin temperature and the
charging circuitry temperature. This allows the generic thermal
framework to react to EC-reported temperatures and apply standard Linux
thermal mitigation policies.

With the latest patch, this series fixes thermal issues happening on
this platform where a kernel compilation leads to a system reboot.

Tested on a Lenovo ThinkPad T14s Gen 6 (Snapdragon X Elite).

Thanks,

Daniel

Daniel Lezcano (3):
  drivers/platform: lenovo-t14s-ec: Add hwmon support for temperatures
    and fan speed
  platform: arm64: thinkpad-t14s-ec: Wire EC thermal events to hwmon
  arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin
    and charging sensors

 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  68 +++++-
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 193 +++++++++++++++++-
 2 files changed, 255 insertions(+), 6 deletions(-)

-- 
2.53.0

