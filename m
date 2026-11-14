Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794655525;
	b=c3k26B9CecLcPodQgdqQm+EemgXLn6JSOvDMa0X2PJ+wfKMV3zYbseyH1LrI91/0+EaO
	 qVctZAEPX2vjWf5U449I6aiMEoL2nAq0ki/6EVj4e6rbMUgl2yRIx3YOc9SQQ2qvjcJvB
	 eGY/kD/mpwCoJfpGFDhEj3L6/zokwr3tk4Fv9zqTeEW/ZGwSaOQN6MLZ4OpP+yndjgffL
	 6Exl4cFjH1UO5fUVMUE0SVD7GRUPZNSXuJHLrRH4e5tBRr5svptPCe1uyPzjQle+CanLP
	 BYDlJdnXMoCnXumUKL4ihm9vkZOgi8DS9j3SIJg9tVjiLPdc4TfmQ7eZehn2K67/qUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=;
	b=fOtNBZJQMB1SiUFSPp9blVCOtuvMq+PodYxYBB+UkrxmRp3I8N5SzCsky0nN4B3aG0dU
	 YMAg+KxtBF1IWOAoPRbHULSeTllOpgF2YFmFcnZYYlg5FX196hMGgdXC9PzHXoV23QmLF
	 pyV0kfPsg17uXbVesY36U6sx24xbl2CwwR8fADMfHAhdtEPXeI+Od4azfIL5VvxOXM8gj
	 vZD3gkRimxrtJ/zW3SLqTH12vUKh63S87CPYxNyriq7N5jlO61FNHMxfm6WQ228lt/iMC
	 ryUqrKjwftNQa/BauVk4UXwhW4mCESb1cgLAiu+Sdj4dBbhGVIUD7GClE2qYrGaEFDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QXgSS9Rd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gaRin3UN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1E4606A330
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 11:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B1E4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QXgSS9Rd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gaRin3UN
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9w9YH464608
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 11:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=; b=QXgSS9Rda3Kv+k9P
	gzqe3kFPN/uWfUmI7OADtIldqWZDD+slzWtMPC/6dTDxMoFuvQd0N7gxLeJPQzVL
	Gx34zKckA+LaBZxTE6Es8GYa5XxLVKKy317T8OsxSwsgfLMrwNDpbiV3RWna2uNQ
	Q633p0yhEKggDTX7xY11chbADeulqMByJf3qChWKnbWHcJGNHise6+F6CcEqaBXO
	v7Rji8HvkddJBsZBOsexcXlNKMu6jOxc8MdeQ2/nDx6+sCsRyufemJ7r0Jkq9hAj
	v0Ns66yN3GBHSutZp6sEOu6Enxd5pUElkn+mYUsqEfaGQv8mIwxQ2sA9HyaUMbFB
	AVbl5A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdrm4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 11:25:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so2971868a91.1
        for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 03:25:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794655524; cv=none;
        d=google.com; s=arc-20260327;
        b=XQRBdrnEM0nurmf7zHBrBc4pMJ9fCvZBjRMBfyGuemyY4tTpcOCFanhRm0lTf2+F/O
         ercYALVNu+1ccyNWP5DOdA1BRe+tTC2Zjwj9isQnC7VUbj2e0BOESIrc3FWFjmRNo8tP
         sLaihLOSX8pFyhp7/Z/l6Af70CdgYN3hoRp6ScBLLhycMwoNjEybnt6tQIkLoZdIcrTH
         J+y9M0Yt/1hy9T9eaYeJoO3zu/vYfolxT+axIs4Rg4jOh2N4C1ZjhrEBiEcYIv1cB9CW
         PxV9D5Uxe2iUlk/EC7y8AtR5ECzET3e5FtsyQzBflCqP/qMQ3eyXKuGeFa95a2evhqZg
         RqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=;
        fh=Txap53Q0T6bN/WjpQeBay9irEz4lsalN+gPoVtQ2Oqc=;
        b=IfV24kW2N0lutU73/dqCJ1VVZAB6g0J3mPy76rRWaQ22BYSfC6tIl9YZx7Oz7qmxBc
         YtA4baUyqd86G06kCPs0nVV7FITr8r5hnaCGYrw1u2HMsXG4YAAIVjgvLep3WVjGj7Se
         wolSs0bPnQqvAMbH/qHTaHveosUiFD5JlSju9PeTQ1Z/b+v7xVwHB4MSLtBMvRJlgYuD
         NeHnrfgB7P5ql0+np/ZnjsQMWIP8Wu2ktA0Pp7G2a30saHCp6aKkKwBU+E2SmH2thUn4
         IP+fkzzJwQUSDveGqRenA3O0/7DzlDmjcVAxsSRXMstclz4hWxaRqWYKkuifk98MmF7B
         W3vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655524; x=1795260324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=;
        b=gaRin3UNqXhDB/YURAsg1NbNfWKgh1yehCZFMlaT8YX9rr5tZsfT7Dih5G0GvWJOSm
         xvWb4tmWJAOEb5bHlGg56+NNS9q+LgULUCyLExKDiT8NhgafE+A2c87HJ16ZE7KS4Ypw
         iRv07UvoK2l9mhasYV/lsSSjbxeqByM1+YDJDF0AXu4ygUD0FWum+310aYxT4d07jPMY
         SqKIveZNUmECHZYtQtmW53BJtAo52x5Il/3ROs1nHJqGnP4VRVq1zipQXzv4IFf0eeZD
         xiu9xmBhFKXYP+JKhzZm9XsSZSZKeJu+xFB2j67q0HlAu3L7icoArOYDch6dRql4lSdh
         M+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655524; x=1795260324;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GF8consLzRBXm7z8P0uLlC0IllouGEyy162epmHymA=;
        b=gloRoL71KuPvGXAK2+3K0zbnbb78wUJV8Oue9tsZmIoM3fevkzUHYt6Kd0zs/DmMv1
         2QzP5n6AqFGyxDe2gVjBLw6IMlkpjSHMr4iK3X1t1vHgCQNmTyc8OoloXYhazI83jtVB
         JI+jyCJouu3vzWryvIXXv/s2iNFH8PsPO14bGwvA9W/Yc2rw4UD8Km+6Ka1JTmCp1Y8d
         8gxPlH0D1D5iROObsDe7hXjC5VKLz1qaZ2cSvNxBI7C7DT5BpaEXb9TZdwEvRomnhTW+
         vu39uPTL2htCWdEWSo2uCbeND5l9GWRB2TCa+b+FFEhE4W8zDCkLZus9xwmtffOmlSX8
         wZxg==
X-Forwarded-Encrypted: i=1; AL+hErEZjIDrKIGOMkbi4zlsX7sS51bei55XCz4nl1I0zDts3IJc6JO4UYcglgCaqc6wUTGa0hcD/KCQnlB2lw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vc1+3ybcwToOMdcr8YLE+rpepKqiubtLCYXHd6QugAj7FFr6d
	ziksyBludZDZPGuxyg134Z1qWNhVh8cYWa6gKdANl+ZiQrGIB2vHcADHN3DwM3VytY7NVTH+qzP
	PHQhplfuKYrxIVpM+vm8uAGOyUDsmJT2hlF/JDP6jJYWEGPHKDXwsgNeJmcuMW7Z1+mW+L0Ny9T
	dw/aE4vl7pzdKdj1UbT+aBc0uDRSBabnmgu78OUGlB
X-Gm-Gg: AYBFou2GJ2xCqA+S3HwfRTyOg0jL9FL5enuk5O5kQ13O0PzLasMTLm3hzX50f3+jN2q
	AHswa2MRv38stqWgDY669V4BUiYX3Z6OIUsIS6mssBZOYcO8kGUNtPnAsDi4C2TwBc8oWpPkY2/
	jtrh01OTZjHvPCDToF6ZCDsAlSON0RVwIp2EWGESd6gOzpOIMl9NGTWdILFg==
X-Received: by 2002:a17:90a:e187:b0:3ac:9c37:9426 with SMTP id 98e67ed59e1d1-3b1b0ba53d2mr5901028a91.31.1794655523788;
        Sat, 14 Nov 2026 03:25:23 -0800 (PST)
X-Received: by 2002:a17:90a:e187:b0:3ac:9c37:9426 with SMTP id
 98e67ed59e1d1-3b1b0ba53d2mr5900978a91.31.1794655523156; Sat, 14 Nov 2026
 03:25:23 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
In-Reply-To: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 12:25:11 +0100
X-Gm-Features: AclHuK8s11-7hbgMIVd4tuDyslF9iqGa3b4ELmL8p_Ex5PIsvw1_iyvVguSEqG4
Message-ID: <CAPx+jO9GW7e0ai2o4Ycc4BKBywTaP=7NiWk68=c2kqcD_VrgRQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] BCMBCA PMB power, clock, reset and hardware
 monitoring support
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        William Zhang <william.zhang@broadcom.com>,
        Anand Gore <anand.gore@broadcom.com>,
        Kursad Oney <kursad.oney@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
        Ulf Hansson <ulfh@kernel.org>,
        Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6af84524 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=vyQqneORv_wdx-tV-QAA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX5Xgc9L3gltBY
 72YEMf/c1IdMqlCLmhUM7SeoSIXxqxtHh2N/7whGFoIzj2vo0hTO70+bs6qf5npCvEKcwsQXNXv
 A57NumYEMtKwln0dsS4J4+qULnCjjtQ=
X-Proofpoint-ORIG-GUID: narlVzSxBy9UDx6iRuPbqgLSOL9IyvS2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX5KV6fm1ZBzfv
 VVp4xpMSYOTSGUzRZVVKeTpR50Zh/TYjEnut1IRUboi6EpOSQYkUYfmUiQYsRP6Y83OEMHFVvGm
 b59bjYWdmUr0itPjz9YnCrnPxv9Fg4OwKEX4O2zRX6gKKnZOt6ka242fvBUmJ74metCwDuz/r/5
 uJnJB87EByVDXtPswh72b6LV096ICl3HxUI46NjHglnZhuf6Ts/PxPQTiz4cQCjQI4NMwiczDzO
 Am/DTRSPOan/ccsxqfWQawlscKaCPoVJIO1Ef/MlsvV/Lcuiid0GyWGSpaAFko8hzQ7IRP71F8U
 vprnAPilVly6QmTp44y9n1oAeEFkLgnU0H58NgJ1NROAS5MXkBfdc5+95zhkw/BQKO5l0yezM4z
 Q/GQYgayk9r0gz5Iqpu4kmOcKraH+cr0zhMsFNMpBN+gwZA2vFdXiJIAjHo7lCqbuquVSpEY98R
 V/gTPWrUPc7y0dzIQcg==
X-Proofpoint-GUID: narlVzSxBy9UDx6iRuPbqgLSOL9IyvS2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

On Wed, Nov 11, 2026 at 12:00=E2=80=AFPM Linus Walleij <linusw@kernel.org> =
wrote:
>
> This is another of these big upfront design binding and driver hoards
> that is the consequence of adding new SoC support.
>
> My stake is to be able to boot and test a full featured Cortex-A7
> system and the BCM6846 XG6846B is one such system on my desk.
>
> It's been cooking for a while in various prototype forms.
>
> IMPLEMENTATION:
>
> The PMC contains various stuff so this needs to be a simple MFD node
> so more things can be added into it later.
>
> Inside the PMC is the PMB, the power management bus. This bridges
> to several individual peripherals which are very clearly distinct
> devices on that bus.
>
> Handle the PMB with an MFD driver with power domain, clock, reset and hwm=
on
> providers.
>
> Expose the standard BPCM peripheral, memory, USB and PCIe domains and
> a combined XRDP domain covering XRDP, the three Runners and WAN. Keep
> the peripheral and memory domains always on. The power domain provider
> now owns zone transitions, leaving the reset provider to pulse resets.
> The CPU and PLL blocks use different register layouts and are excluded.
> This new power domain integration has not been tested on hardware.
>
> The BCM6846 XRDP reset sequence enabled full-MTU traffic on all four LAN
> ports and copper WAN and has been tested on that series. The zone
> power-up sequence also passed direct CFE flash boot in the Linux 6.18
> OpenWrt port; this folded v7.3-rc1 revision still needs hardware testing.
>
> MERGE STRATEGY:
>
> Through an MFD immutable branch once everyone ACKs the subdrivers,
> it will take time I guess. Queue the bindings and drivers in MFD.

 I assume you are referring to patch1, 2 and 3?

In regards to the power domain driver (patch4) at quick review it
looks good to me.

If Lee decides to host an immutable branch, just let me know so I call
pull it in to apply patch4.

[...]

Kind regards
Uffe
