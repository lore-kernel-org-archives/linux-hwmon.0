Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792534106;
	b=uM7FUqU9HOXd3ouW4geh+Xlati7jkv1m0XCEpWYNX+XWH8pJ4NYH45NvHSwq6C3kMcQr
	 uhLYDy+/hx72zKn7b/MrO/uT57HedhAO4v0djpgLWC974Gttelq4AaPxnjPBloRVS40UA
	 xE2OjxNzoFilJVlBHGmH70qy9mdfOslZ/YanTl6w76F2X2+2Z9pmdsD2oCHyD4Xo7ioYG
	 v67V77Cg5c7H9A/PLY+N2zVvRYFQqjIcEVXW8JiLe8v8oLDf6+87EaBjW7AK4l5kXIquh
	 lYS2Hk6/E39EjKhCYLsNvMDjpWlqdtRSa0guaZ85NwdGrwiXIXP2vYEjyY9Nvyh4J8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792534106;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=;
	b=aHhJHU5mp8AOfMOBC5oac8KqDRVxzVJ8uu5Od4DX6CysZq1XtxSw1/n2ObySrXjlfNPr
	 rewzepZVF8q56652dNbvX7tMG3aY5Kc0aj2W6UWOWdIe/BahyxAKGLr4R8tWUTGfJzwqj
	 Jo2+3YVwVwgbP6r/5SV0PMr7dL0I/EqBW7W9/OeNqET99TyEhkr0+WazHTMFOWrp5qhDg
	 6eSr96zGISw1aorlJfSQ+wlL9Za/Y9soQrtP5P/V3WdwrkFBSstNrvBzdiFTRdkHKgRYc
	 hVUkqsN9/Rx1WzO/NKWBzUBVRezjpym9bVEeEOMF71DZKlZuzwATRHA1fygYfm8t7IA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YlaRjfcq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VYJvx1au;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F1F606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 22:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98F1F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YlaRjfcq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VYJvx1au
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKtoFK2795597
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 22:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=; b=YlaRjfcqXcboaVER
	1sRzZAh0HZmehbrFy3UhCVu3vYTichraLfUUhymZp7bS8WmM+1ILHlTWUJND9zH1
	molG1kOsh5qZXu4oWndIDWnLZYCKH5bhpLi6x7KTJOgQfqirofxKnQIxaeQxDMmZ
	T1ptdo6i4RT/9PpAHw8RWDrJA1UBA93lUQ6EvzTa/qWKVJrPqHe/hpRFmntVORul
	huURSP231+POlZc8B4gHgfOJibHq2Z+pltWIDWIcz0cUfyUsdLmvtm8pRMYXLrF4
	VPqplyftx/lioIukz+3RRBitIdinjEeC4elRpAXXTxtCIBRQwUlcOeoAROSmvKWV
	sCuQtQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2acm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 22:08:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so39397a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 15:08:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792534104; cv=none;
        d=google.com; s=arc-20260327;
        b=iFgmL4eUJ+v9lVJPF61JMBm0gyLnnCG2zYC2vaZwEbMr6PJIHt+nPhZzShbxj9itGk
         dq8pWJLEqAeisMbmVsapbch0apWwAwpH2u94apGRYJE1PWoyuC09g53cSSv84zLrP7vX
         QkVg9S6wsLI/Y2LXnMKa4pIOg/UMKhfuPCU9TixEAivQ9/Sd+hVhLWpujqIP6ba+O4Jd
         RkI7DOtzzGmbx0bOuurM0MD6bMdovwQHc8sBaaJlCQi8QK9rMUkziwhWy7KX8nwjRyqx
         zmr94Jr6+FK/hsBhhvN/PWAd9fCfRdCjKPdGsRHE79fCsFWD+uOP+gyQcSBh0Kr70Y5H
         Z72g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=;
        fh=/kQvlUJNYqkftq4JoJy+A3AFpcdZGbnUP6CLK+ZRjx0=;
        b=F6CPqfdopF1fzuz2y3gjQlUswxTLVh8PMImML5UhTZYv79eN8TmS702qxWMxKcyeWL
         RTT+tBP9dzL+cEUjFHRNR1XhQhmncei4qBS7Ut7k4HeIkkHfIENLtfS5ahB0cApcUKlu
         RnpGup6UydmvZWcehpzKDSxwu6/IOXwhjEB7sYysFRfbo/vnvPGes4G00QmjME4pOpjS
         Kqfn4ad+mhYP0Ya3FI8LuD3Q/OthyMY4sgMuc6mLQkps99uNMqEUETfOOgrqOHqvja1M
         2QPjY0FlCftnNohZh9Wcb8LPRan4jqmZxTKpgmNl8kU/NHuq7nQSFCZAFNlRHogvA063
         FTwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792534104; x=1793138904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=;
        b=VYJvx1auuDRH2wVC08tOG9Z20YTD5JPjYHPtr69HH03y8NFtkUZcpGNLud3yPWIP1u
         miaymRq2HtxRfK6hs/X4WIkzzAYxIt59HyXwmDxmKCJlrES/2eqUjmZp4gjJXWFkTRl7
         U9p0gygH9rfH/75K96YMOdfoTuHvwtYJnj3rEFlfT4os85Vjb+hPG+qrDGs6u4Relznb
         tKnrZ0kK9mQmeSZtDJLi423qdZ8CuVYqdOIHalNpruqMDr1Ji//ryJZKdzwhsGDwbmfE
         IeEt2OKM/hBAcXFo0hZ1cSjnp0iPm1TUBzAgiqHOeqwkrjIMMMTeilnuummXGM4wtwqj
         t89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792534104; x=1793138904;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvrfjD3yEpX3v2qha/GP6cEVLRQb3yl9/nVMpyayXVw=;
        b=IQcMgHc/TzUAJrXFSya5040t4fNfQLeVAGtvDxV4v9w11U2HLptjJ3Z49KbyrcVlj2
         f5HayIHcQ6lLQntgExc90bpmTxOnueDY/EWY2x+Eh6cN5pVz3T/4kQmMSO9Qu8uKQ1Q5
         6fgxa4Z9FnabNOzh5qkLgWpvwnmcqCrXi9zFhJiT7Ukq8VQBPzpvO8PzzMk82fq91Pd4
         33vj41eT5mUyFVIA98kR8gW9wDuuj4t6bi0uEGQQaBEoTlFNe7194ysXo0FaQr9G8y5e
         cuDt11kHZLKPVKXx7hvoLwTsfAop+P8qVGZdSIsmlgihxh/pWjqyR/Xkz9IOuZj6XmUa
         TfEA==
X-Forwarded-Encrypted: i=1; AKwUvBwBx+bPE/t0crEnYqykKBtkAOy2hqtpdUaIGfegq1Zf1X8xqmq49bomq7iv58ZkYLSoBQYHm3bL2kU3Bw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIg2moHHLrz+aEDsVXSZgyvNaJVoPXyw/qMGIrhsdzjXUqBmuax
	Whwze5QaBYnAg1mjqC/Tb9/IPx9wCdR136/7X3hztIMoHzfW4i7stjpdCAteZb/acqQtcKpfM/8
	AQrFlr8/o7cE9/ZQZzqOybml5WMbXg+kaMRZSonigrwXrZRe2hGX1pYyrSzva755X3z/S23gMaZ
	HiQHD9LVBkyyczsdDz6h+pxhurV2NsMf/+6v3C/EYV
X-Gm-Gg: AYBFou2FV4t4drkhP0aibCey9ii4dvN2+WWPu5gctK5oyobq5ds8u8V7s71bklEWNjq
	WV6DuKDmYUNQ6kXTJm8FmUA06+ki3xwVr3IsAcNz4Y4R9t0jzr/x3JdjoJqTBCNMsiur4+hjaOS
	nMFpKG2IRb7m6IdP0Ehfe9Ktj4hUmuL0N0UTIltG16oziYx6u28mYikwxy+6d/mX2qrD829sEui
	vzYlpJR6NH5FsbzWhnw5+KX8USOY9eQzRp2ryjYrhKQVPY=
X-Received: by 2002:a17:903:1b4d:b0:2e6:dcce:8222 with SMTP id d9443c01a7336-2ea43cf0d3fmr947175ad.57.1792534104128;
        Tue, 20 Oct 2026 15:08:24 -0700 (PDT)
X-Received: by 2002:a17:903:1b4d:b0:2e6:dcce:8222 with SMTP id
 d9443c01a7336-2ea43cf0d3fmr946955ad.57.1792534103541; Tue, 20 Oct 2026
 15:08:23 -0700 (PDT)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
In-Reply-To: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
From: Loic Minier <loic.minier@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 00:08:11 +0200
X-Gm-Features: AclHuK8EIJ8ZjWBQ6mFXW1Y_Kcn10ejjzpfnSn9R3N6EwnixFcyxmqimJkA2vVk
Message-ID: <CAAwKf-ftxr5fw+1Jkz17YCROjDB1G+7aEZnDyD-zs_d_OrWJJQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Asus Zenbook A16/A14 (UX3607OA/UX3407NA) EC driver
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: ios-KxIp-wxqwky3_6xAYLqE2iwIn6no
X-Proofpoint-ORIG-GUID: ios-KxIp-wxqwky3_6xAYLqE2iwIn6no
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad7e658 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=bO4u5d9499Dzb9AJ53AA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4OCBTYWx0ZWRfX07Uqx/z+eJsT
 bV8sWIKz9AkiJQY+bH0dePM6wqMy1JBFUkIYq3+V/hUZnZ28MdEY7YQQ1WxHHF9hBoeFywltea1
 AqMgizdqysV63C+HrEZjvN2Na8EI0kw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4OCBTYWx0ZWRfX5ycBmt3s2vPJ
 Swz+BDY5cMsJ/gSBJ+TjV/f8Ti2MO2sL2MCwakWQJhrpX4fBWAgW1PZdjmVQfVEd5B1BcRyaz22
 QNpKHD7e/lkNTRIa4v2E9N6jdzDWp8ScXrE54UXChzeCrfr4S/r/GwCk5IIXmPnmcgHcAuabiV5
 juphT7fzJmOe61TXTj+JF2CsR83n/HcRqmw1ZQqSvMoLFwcA4OiqS6YElJf+Jrjz8InLGJfvdyd
 +/GEZcPxXjtSft2EY8lK3HYQh+QIfqptyhqU8euKc2Va2rrXe2BZ0VeNTbrobveLAD1VFxv6Jeo
 eD6gOCCSlxUG9sjL2beQHrwG/Ggob6CwcSgrTNIpCVgM8VPhCRU4enRTZGruidVlUV/tL5uhUFn
 9AX2PqpPhJGiBdj3Qk4hWD5VW4gPZNf6GzyMBw+Ud1UPVEEtA0eMcPRb2uH5eI3n0LL0/56dm9W
 vBZkOtdA4wlgMQQ8LXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1011 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200088

Hi

On Thu, 15 Oct 2026 at 10:59, Konrad Dybcio <konradybcio@kernel.org> wrote:
> The Snapdragon X2 series-based Zenbooks come with a bespoke embedded
> controller firmware [...]

Tested on Zenbook A14 UX3407NA: hwmon temps/fans update with a
stress-ng load, keyboard backlight levels 0-3 work from GNOME/sysfs,
suspend/resume works.

Tested-by: Lo=C3=AFc Minier <loic.minier@oss.qualcomm.com>

Thanks!
- Lo=C3=AFc
