Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DF636DA13
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Mar 2026 14:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238928; cv=none; b=A7a+qzkNYuJzGYt49gM/8OHXKsDUXAM5S7T3YfPKr6t75l9/VwbXnSLRGVjUCezjmOCBOK3d1OzTjpQpC//ibQ31dAulWI34c6D1PfgPX3rZGUP9PTOswReTLZRcXME6aC+2GEjj0jHwSCk3xpeyAcovk8ag3gf19/PiGNh3bNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238928; c=relaxed/simple;
	bh=BEse+cE9zlBvxfia2wA5EtEVYF9p+DcpUxCB9fBv3og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jAlMsUELWGCNUMfq20q0tT/G9gXQeTHhLHQNG4W/Gyy+L2FoC4zZvSWAD++O3HDjJxPk7NfVGDwnk0aJlGVLgISF3BBpWaojHsBd2iT2+8x+LlGwqbB+3HeSD2y0rJlUgfneRbCLfWNw5ugtSnrvk6u4vzpo3gY7BrCry+vJXyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cshuT7wH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QgsL01Gl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cshuT7wH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QgsL01Gl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BD82us4032746
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Mar 2026 14:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aTZnadCn5tehATe+DzWXrlLxONcL0EVdRvHENRNkgS4=; b=cshuT7wHAs3bMZMY
	khk9x6m+qS6xTCEUcOPzaMl56J8Zdf0pDHEm2irMYh1HtIp7rTQxxpHePQb5Li4K
	ByAxA1VA/0AxbB9HODpvwwGNK1yKy5AUSbI1TvrY26L9JsZeVGi3TUkX1ZyDCRso
	X69PDYRu2SZ5upsipdafMIjH6ctabMvTzXCh48ABfbKpx4a0WT+sSrA9BRea9q5V
	gqbUAxJn8VG3wZMKgm2VJZaISGxuQh7ON3JMH+vrV3TYmFaykaLcFQIm5ZIwl/fI
	x9F11o34ENdueJpx2WPiEEEZwu0AXHB2mN+Vf/KbeMbFTj3tCsc0oEthLGqHADJw
	wSNa0g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu90t89bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Mar 2026 14:22:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd8b37d4b2so2146572585a.3
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Mar 2026 07:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773238924; x=1773843724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTZnadCn5tehATe+DzWXrlLxONcL0EVdRvHENRNkgS4=;
        b=QgsL01GlPH/oery/yh+j1mCQpFUJ+WXRMZ823Sk32GkAYgGVFIDBQI53fh0Jah4DQ2
         Sr1pDyO1PZBFHNfp6bF+EXaBJkrxGgLSzlTbEQSrdNetK+2bwf58P8tp6R/PcQAJA3/7
         EhYEDA8qzeHoCIxrSDUlUghGSWTj6mbJEZ/4FzAKzolb53L2JLcSBnvp7pwqGhWdUKHS
         TR3GFdK2wY3az2pwY5Me2Grzbu6hOLPTG7q3h5UW+cV8x/Q0naIyIfxpUR0RUkKsnxU2
         BsDrU4IxjAwZqZ7FB+oS4QQHSg4nFeWlEkcbV8LFmCNUXNfwUJKjLR1ka20cTdFY9W/P
         bXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773238924; x=1773843724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aTZnadCn5tehATe+DzWXrlLxONcL0EVdRvHENRNkgS4=;
        b=GJmoGah6zwYbPDDnqE9Y5/FBsIaf5X+UUURu6jnZaS4qrpnwiEmC7leodWd+34O0LS
         0/HPSlUwxXQqwdPlZmw7xgJXdbtsuH5aXfg3HMzmeDNvrc5M9Z6TKYh1YgMXEr0/wgI7
         0py95wmWpsAWvEeYK518SRpP4BQ5wavl/8WGqKUjge6P3DvRwgZTcUr3IFHNYDexcng1
         8SC63xpLlifjI/Xk7hMmpD8Xw5kQsACvmsgBY5MqL5t04dbLwCZRensVib6VEK8/tY4G
         JzsVZ0pQvy6ii8Wq20BW+Wu0NbcTnJPMctqZEWp/LUJJGX+fqVIFeUqfu80GPGwxx+JE
         vIog==
X-Forwarded-Encrypted: i=1; AJvYcCW9hhQ2kqOFZXBBiXs7yCpcZ/Og3LJZO282Ytg4ropyQFsH0KOEKkLyPIH+Yp9qFC1DhFiAE4wwR7SvVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yydwfr3fNDyuI1KLasm8feRoTXcA41uwgVfzx6Re+dFLDLtwDWp
	9iCvlRJLf22/S2SLsOw8MCKu40cZ9UnQhwoZF1+aupRLuN+DXjXRqtyZe6QYJ3eng9QaiqwppX2
	nIo6vKZBpmB261sYLM6b3qR0/dev4B/Lvo+n6led9K+BhvvapgJlDjTYTfZkDy7aQSg==
X-Gm-Gg: ATEYQzwSCVec0TKemTPPRw9d2jLPiz06qsETaFMrhD0uB3J+1mUrjhAWJfWBN+j80Xj
	yTA9InUCrjXZJ4rgYc3Qxqc1gASSQUyzAd5ftgB02NeG64V84TiK7a0sflmQckAjL4SURf25ZfM
	7dPIKfHUNnyIEHxJ5cuJqIgWWfh+KiCiKIXLnJ6svivlXE6mnujsSSEDKzNDsw5U4ESt51IQtpf
	tg2139HsfWMGEx+3EXHnZKoLTk1SGgl1N4Ammyw1Nq68qL8HskrR/a5/QKXyNgc01GVMgo8yS9V
	IhVpo/Vkxb+qVEPvKEpx/r1xmqy0aEOlhdy686ES2gDmEsZ+wrCCHqdUGtQIOEwSSyD3+WULTMV
	v5tAlnxlFO1Qs9dVLvqpwdFDsZRUlpTB/xtscdJQ1CYNLQ4T4VkQ=
X-Received: by 2002:a05:620a:468f:b0:8cd:a071:9aac with SMTP id af79cd13be357-8cda19f395cmr343231385a.24.1773238924087;
        Wed, 11 Mar 2026 07:22:04 -0700 (PDT)
X-Received: by 2002:a05:620a:468f:b0:8cd:a071:9aac with SMTP id af79cd13be357-8cda19f395cmr343226185a.24.1773238923609;
        Wed, 11 Mar 2026 07:22:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:3a92:6740:d71b:5056])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e14ac0dsm57656966b.43.2026.03.11.07.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:22:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
Subject: Re: (subset) [PATCH v3 0/8] mfd: Add support for NXP MC33978/MC34978 MSDI
Date: Wed, 11 Mar 2026 15:21:59 +0100
Message-ID: <177323891652.11261.5778359438358477174.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309134920.1918294-1-o.rempel@pengutronix.de>
References: <20260309134920.1918294-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: D54oLGwSg0EDAeJ0WnfVn92cHqvc6z24
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEyMCBTYWx0ZWRfX1zUfNMHs5Cmv
 SJC5VSh6pa7CkjL8RwGK0YQQHc76NpJe9tsDj7rwWb8h0cBFvsD9Dzt+itfCOk+wUa3x64NxY6V
 LZF6SW9YTbRFeIrtep2mVs8DDoGK1rjcPPZ43EMvRrC4xTX7KDCSjFXcRbLSkK3YnpDxv7TMVgT
 PNeVgmpYZWpp+8zaqbhkFWInhHLCFNoEXg2T17w0rE2yk+qZ47US5l0zIjFNvpWPiKxrFraRC2c
 4sGW9rcqbESpXgm51hUfNtPFPzo4OxDo6Ty4/i3mPJJMgbdRG6KeXTVkhqVvP/ThyD8f5IU4YLK
 jVL+sFQg9f46wYi6c5psdlXED2F5m82g3KhxKt3XR+yAD81fUXmrPhZsnJODWeRZFVufFkIr3b0
 Dw3kKL110RSyIQ5+6+vp8MftQWF2uwdEsGnoyS8fumhZinvcDbjP0gv88PQcPHP6WDN/b+ZhT+s
 69wXOhorBrRMf31YKeA==
X-Authority-Analysis: v=2.4 cv=DfEaa/tW c=1 sm=1 tr=0 ts=69b17a8d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7B33ad9EORelKyuzWjYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: D54oLGwSg0EDAeJ0WnfVn92cHqvc6z24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110120


On Mon, 09 Mar 2026 14:49:11 +0100, Oleksij Rempel wrote:
> This series adds support for the NXP MC33978/MC34978 Multiple Switch Detection
> Interface (MSDI) via the MFD framework.
> 
> Architecture overview:
> * mfd: Core driver handling 2-frame pipelined SPI, regulator sequencing, and
>   linear irq_domain. Harvests status bits from SPI MISO MSB.
> * pinctrl: Exposes 22 physical switch inputs as standard GPIOs. Proxies IRQs to
>   the MFD domain.
> * hwmon: Exposes thermal limits, VBATP/VDDQ voltage boundaries, and dynamic
>   fault alarms.
> * mux: Controls the 24-to-1 AMUX routing analog signals (switch voltages,
>   temperature, VBATP) to an external ADC.
> 
> [...]

Applied, thanks!

[4/7] gpio: gpiolib: fix allocation order in hierarchical IRQ domains
      https://git.kernel.org/brgl/c/a23463beb3d52815e5f8e61998f5c94f13274544

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
