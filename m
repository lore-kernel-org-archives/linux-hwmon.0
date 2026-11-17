Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906844;
	b=bsljXdunf8HlzKMMTfXRpFFdi5htK5dzU9gqufzWm4PTImEF+qRdieKQCgmsNUjLE9ow
	 hVk7H2yVC6/mDc9vdR1OYEffwKBur7Q/oN9p4OLtmuY+Gf2YUKwUAOCetv2jUKIwNix64
	 WT7lrCNdt2paPvxJbwkaMkWQPR9nJBYyxjlKJQyLBcLX7XDYgBaDgGtDVPELZ4qkExMcH
	 IKF3iQjvyKQhhN0YvfN42jvJ2wbZKdAyo9O4cBLCyooemMsKn2A1ACglBY9Pp9mg64Vtl
	 RjL1RPu0VbWUL5jq1Qloy9ADEUGkI/mIy1YCljyhhFQ6/suz05I2UyqHOt1BahlPUqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+w54tE3YfSTZ+ts4Fj+EjjQA9ICa2KmKJm+TS/7vB4k=;
	b=hJP4rZ1jR4MwMzBi9c/h/A6n1ZkLD79vZNNVVRBZTfpHhLv+yx1GHZeV2b+vyrPUWjHF
	 BoBNrjxwmvZS1kJM4qA9ed71qdbIbUmvcxZvRs4lG3THCShFbbWjpVkHOHwJpsCSpS66b
	 nWU+6yGVC0nP5DvHQGedHtYqr+oFJQieCH9W/ZfNW010w3dCNptl4v9Z8Q81flvI2keca
	 jnH0IjRoYziZ0xW3ucBF8+bLCWZc99lzCtaO5pD01OIPyKLXQOGvo2fYv6Ihu44JobFN6
	 NnsR6//Q8G6opxhf5Jf2vYNm3RW9mrt+pqPuvoW6syMRUachbDKmIGZNK8gSu8DiVyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hZVTzDz/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBaXqZMR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17CD606A323
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 09:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C17CD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hZVTzDz/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBaXqZMR
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8T35Y2934210
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 09:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+w54tE3YfSTZ+ts4Fj+EjjQA9ICa2KmKJm+TS/7vB4k=; b=hZVTzDz/XtTO4viP
	FrXqnBfgsXE8rhjwexNMBxTEZozKv8tMrH9ZciFDgdjBJeW0OI5F4vcxAM3iAaDD
	hY3okPvDHyjGDImGxeNQQS3iUZ0ma49hba1JTDK626caUjM8zBPnWapjKZfdaIZ1
	8zXvVZh0Wj3LnI+WRwFFkF4HatLVTCXSpkFllwN4YGcGkJ3M2gumTxv4Vv1hW0lF
	v2epjszqr7uwBMeamodpZMdfDmrh6N9WhAmhhnp5Yn48G5YjJ8eVQkyWVeM9OFUD
	71kUTgeM8sW2j6YEq+v+9Ldo53x6nQbrUN+uy3Aq2fM7viIt0xwrA+slYyiTT0a6
	gpVXCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m0aan5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 09:14:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so778512185a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 01:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794906842; x=1795511642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+w54tE3YfSTZ+ts4Fj+EjjQA9ICa2KmKJm+TS/7vB4k=;
        b=TBaXqZMRTpNeSO6OLDFX8q9T+ai5snOlWnNAmVZEQyFoz+bYoleAHGWIgAQvaYDbV9
         NzXKpJz6e76UoZC18oS4AEv0rpHZRE04Ym7cGA6qF9iEm2ylCUUc37bM6MVPoaX9wS5e
         8KLxuHxhtk0JUmWmTLBcZ66eIPwm7tyui/OvBFrvSZhU8O8+CxlJcpxn5Y2KNcnEDrW9
         c8R8tx/bCtSCHByvR2kANqxT+ZSnFn/9w0z+HFTi1kDKhp8bTdLEMQ/15Ez7gCB1C2O6
         OcekxhrC3Z3YOGSsZQD64BH0UqV4dt8rAK6FSEEGOdFgwoJhyjRZCTtXPBixJjc43Zox
         dQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906842; x=1795511642;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+w54tE3YfSTZ+ts4Fj+EjjQA9ICa2KmKJm+TS/7vB4k=;
        b=taw3zCBfF5pFBtQ2fkP3ZWCik4ZOZotIRjLpDUvkO5De/XuwDxBVV/0DpqXzNy/1hS
         Tpry4oaUqAMqnwiaNZHMNbU3sFISaJshLBoIetvsSj9vgP1Ny/pF3QvEE/TeCPXlgKhz
         qtYKaptG5fuy9hKCiMM9OpS4+VWK53okOawl2NAqpk3n2PJe7+6O/t2ACQiO2R4aktXR
         K1NQ5gSImLFlO1V+XaEXIwEkbH5CI4pzNRrErs/ZIaAdBEF8pbpqGfdhAJW9ZTaYN0JQ
         T05sX/5ZyeIpKtbvuO3TiXW6fCKvG/lOh77rdpIc8p1M7StMj5C0kf8y1qkVzVJzFxlA
         cgWQ==
X-Forwarded-Encrypted: i=1; AL+hErFNCBD3j78uIV5sNUE7dyHarJ8OZmsZWZWBhBQLqbWBD4fYsM63QV1KWTQW2vPAyZ2cWGdtZpWWy5CXzQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z85o/h9NAOEIUxG2OdA6chLJiFgcOB2glF7EPAJsdL68hKsxlrk
	0m536hNM9ebXQYMXqcSrTIw2n83Gh+MYrD2RPSL4kKNvTuuSEpDU/BgGQqJ22pEMveLIkNwS6Se
	TkJzWFDcjPSAt4zlzND4M7KYxNyAa/TSBF0fTi3LD4jyPC4O66at6FfOdtqP6Bu+6Kg==
X-Gm-Gg: AYBFou1D4tk6fuGvKDvotgUKuaYTDdxNLepHuQC6XUF81y/PBqqVY/btZxYEQ9He2qN
	LGO8HcT3fQvsHEtXjsOINu1WTykUngm364LNVI0bG7eat0Hm6R2lOfbBUXV6SywspGa+7MvYkM9
	t/Ibys+UXHNN1tcpxDXzNmzfXUhRiDb4yU3iHe6s9v72r8hxiYsxxgNxpCGB2g5+vXEB0w+C72Q
	N+Ovmi/LldPQfX4GPRE4Wyv1XUfUXEFGFKPFG+DmZvsGC4/x7krvTutUFSrCGksBsPd0ED+ZiYF
	upYH1bNe17vXzF9+V5csT4MeBX7xdfWwUcdclWq2q7gKTja7Ierp/dCtsvw5ml5378mHmIBfQyI
	sYkAYfAAJPn6sGtE6V2XviaMzy5Rv6kQ8qZAaRzK1exD9viqeH8f/uCci6ZnfcE+X42bCehonWb
	A=
X-Received: by 2002:a05:620a:3726:b0:949:6b0d:7309 with SMTP id af79cd13be357-9496b0d7681mr1398324285a.75.1794906842004;
        Tue, 17 Nov 2026 01:14:02 -0800 (PST)
X-Received: by 2002:a05:620a:3726:b0:949:6b0d:7309 with SMTP id af79cd13be357-9496b0d7681mr1398321285a.75.1794906841503;
        Tue, 17 Nov 2026 01:14:01 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4dec730f7sm1177496f8f.11.2026.11.17.01.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:14:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/3] Supporting LTC4284 which is a negative voltage hotswap controller
Date: Tue, 17 Nov 2026 10:13:58 +0100
Message-ID: <179490683060.18860.17025405055140807603.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117-staging-ltc4284-v3-0-326bb844e08c@analog.com>
References: <20261117-staging-ltc4284-v3-0-326bb844e08c@analog.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfX0MWoXiw2S6KX
 aBCZ8iTkDKEuV7OHwAmGI1yd01LhwaCEj9cfFUcVCmN4rqVf6hXlzqGam55WzBE2BdiQj1tXRim
 hDLWQnrAP6N+w5PB6acvVjXntKWiT2Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfX+aAfyAUZA/ir
 bROvOneMfvnuiPZD77FEjiTmZT5OCvlbhojzqeUNc9ZswTxIufvpjDXITus3A7iwVeiKzkou1Qu
 1raLIrlwCf7Elg3Q7fUTpmxfb4hID3MkhEWdAJe/E0XEkpmP10OcjxsQ+7BgyHjPVjrVeEnPrVM
 jZSxGwnF0StAdSLLyMaqohjBE+qyPjGjJBQnya7AXyQj4vEqFKHeu6LmFjVVZs+CsAE1F75xEYR
 g95R4HuWwaAotJTZw+7iHGKNKSbe7dxwvcHmJiDRvRKsDpuTyuZSlZxn9ivZbx+odNpkqvWVUjp
 +Yn706mTr8CUTV10sq1XrIzOPGkwy+sMEfKVgVArfuU+eylXOU4WnwyqGOLKEhPKJpB0Wcd6caT
 ZZXVCMn+vGUkIbuYscZS0TZn/FHv9Vw2qE6PqEn3L6V4a1aVvV33YC7EFFbJm1ellj8QxYGF9qc
 ZoUkl2MjZMUjjRbikFA==
X-Proofpoint-GUID: ArKlxTaEPi3P-X_FLdVE8C24-RkoEJPU
X-Proofpoint-ORIG-GUID: ArKlxTaEPi3P-X_FLdVE8C24-RkoEJPU
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc1ada cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6zx4bRIOlK1EkWDDbbUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170036


On Tue, 17 Nov 2026 16:26:47 +0800, Alexis Czezar Torreno wrote:
> LTC4284 is a negative voltage hot swap controller that drives an external
> N-channel MOSFET to allow a board to be safely inserted and removed from a
> live backplane.
> 
> LTC4284 is very similar to LTC4283 but for higher power. The device features
> programmable current limit with foldback and independently adjustable inrush
> current to optimize the MOSFET safe operating area (SOA). The SOA timer
> limits MOSFET temperature rise for reliable protection against overstresses.
> LTC4284 also has up to 8 pins that can be configured as GPIOs.
> 
> [...]

Applied, thanks!

[3/3] gpio: gpio-ltc4283: update Kconfig description to include LTC4284
      https://git.kernel.org/brgl/c/c6d8ebd7324cefda867a701b4341605b681aa3f5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
