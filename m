Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6E64A11
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Apr 2025 17:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745773696; cv=none; b=Xcbnc5oj86DDHbgdRiLfbmD3xfcIVLtSsMuGiMNcwScrL0Dx/LxDa9nbJJ/So83yXzKAFbl+Q3oWOL5qGQt+g+00T19Dfk+PwXEvbk6Te7JVFzsGc+CBbLVy79XSfqW/JiOlOuR+Wj3vXJADPSMq248JNmJduWxLOSdBOlhIoCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745773696; c=relaxed/simple;
	bh=uCAodYVxX7b4tsiWkmjBmSv8SY5Pc0vrbPtrpr7nsTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJhTEt6wsX2QXM4otT+bQc6Ag29SCbmKSbpBf6KDc3+9GVcEW2KhzjwvwdT12y7HgYu9yfsBpyzcKAK6x7wgFp58YkMAQOPE9iVPnq7LJ7wP4yBc14wPEsfHW/4PKe+PL2Ct+Tb/F7EZxjb/Kb0mvn3D3vBcaTwqOK4hAEM+GfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+tdJiOD; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+tdJiOD"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736c1138ae5so3977544b3a.3
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Apr 2025 10:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745773694; x=1746378494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1hQW/b22vanJ1X+GZzw2Py4nTQlhiXL+6L5qHlidSi8=;
        b=A+tdJiODTCbfHXkbzPFdQt0UjO/mDsnOwRlCfZodHlRuNc8tHX1+xARgoSCgFrY3x3
         7it4zuiJj9HLk9CKnDnRqeTRl6SmirJDsMTy1bQFSCFSmLoCb+RzMyTg88vDQsOJRBcN
         75aGFAbgDBvL31OzP+rjt28Uzpx1ljiuMOr72tkPS06pZXRsohzTALB5bZhahx7Y/Hpt
         Pwhrc3We/KEiTeM3eXuZT/kM41abPitgp0+pWw5/rQrdiO8sx3QOEEJiQyrla8jA18y3
         yLd7MafZ9nK1kdgENpSYwuduY+FqiGuCBtwYYHu2JdBanOPMEE0UEMf2ftZ1amoTLlu8
         LkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745773694; x=1746378494;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hQW/b22vanJ1X+GZzw2Py4nTQlhiXL+6L5qHlidSi8=;
        b=vJmYnNp/68jIQoEm65keVzx8Dpb8T7E3ioAI+lZx4Jd84l4asuEb6+6kpwUtC76lCd
         bCZPs7uNiYDFapyNxZ+CYEpgjnlK19mIGy6l13jfzzB8rZ14zETSGzN9ZrO9GeH8HjpG
         nH2XXpDknMqspcvdOT1NUcsq3QMJjr4QBTnxj/tJ4R96ir06Mol81Upb0t0D4kzeQv6D
         HEOFv/+LA7SKayspJ7ujTNdCwcJ5qRmMIccSoVw+VsHlYDibYlztF5NT99aso0B60UM7
         drWN7jzJjQSvRT91opR4QT7EoK1IRa6b65c4ctqPv5ceHWIJ3wa/cTeTUmy0UVrct2Bx
         agXQ==
X-Gm-Message-State: AOJu0Yz8TF2TGgDWdiyp8uHGZBM5TdhkXP5xmoBHIlq5SlIP09hZyyXk
	vSn4e/5elga4oYGst7rBOEurKboe1e0Hhr/XoNDbf0m1rCvvEvOtzrBLLg==
X-Gm-Gg: ASbGncsIZRuzhbd5iZt+9A0tcdrRDhNQ+LDI2tq2/iobWHBRZNcI3ZDUNaXkzZXqVH8
	zDl3Gjii5NWiu598qyC7VP9YlrqtOVZr+nkWYaacNh0FtR2LRDJHvqCrMpGsMOsdmHx97Xppodc
	fLDZ4QifXwHVOIBl9Bl6P+e1w+yWkn7id9enYgNKPslTwq+vsay5/EUzMBfxPeA9YUmxiaQrmO4
	97NVOqQHZH2IHfMVM050VOAjRp3D6cVW4OpFbZCm/Lv0/76Shy7kTU6vY8/ERvEVnRYHWjPNvZV
	BTcO8iQHFu3tbAOgR+MdlAQNjJk0jux6M3TE/A2UEMQy02hfI+2UfXQ4tGg/T8sEA3CzPozngps
	Mc/cdBimm4N2eO0zzob2zSekJ
X-Google-Smtp-Source: AGHT+IFANtajIyThFfdXCM1jmd5CQx7PZVo7Vcl1bcLgIoOSmLodtr6+m1sgQOpAY/QSlxPpMv7fpQ==
X-Received: by 2002:a05:6a00:986:b0:736:46b4:bef2 with SMTP id d2e1a72fcca58-73ff729d47fmr8174711b3a.6.1745773693982;
        Sun, 27 Apr 2025 10:08:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9abf2sm6322922b3a.122.2025.04.27.10.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 10:08:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2562b90c-39fa-4fd6-8acf-777fe17b2611@roeck-us.net>
Date: Sun, 27 Apr 2025 10:08:12 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Consultation on extending hwmon channel attributes number to 64
To: "lihuisong (C)" <lihuisong@huawei.com>
Cc: linux-hwmon@vger.kernel.org
References: <1f8f24e8-0ca2-4fb0-bb69-21965e1c70c2@huawei.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <1f8f24e8-0ca2-4fb0-bb69-21965e1c70c2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/26/25 23:32, lihuisong (C) wrote:
> Hi Guenter,
> 
> Currently, the implementation of hwmon core limits the maximum number of hwmon channel attributes is 32.
> The maximum number of used attributes in hwmon.h is 31(namely, hwmon_power_attributes) .
> Actually, we can extend this upper limit to 64 without any impact on driver. And the main modification is as follows.
> It's also mentioned in series[1].
> I want to know what do you think about this? I will drop this thing If it's not necessary to you.
> 

I dislike complicate solutions if a simpler one is available.

Your suggested change still increases the size of struct hwmon_channel_info
for every single driver. It is also not complete, because any definitions
exceeding 32 bit would have to use BIT_ULL(), not BIT(). If we need the
increased size, we can either add a second group of power attributes or
something like

diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 3a63dff62d03..837c11fb1e3b 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -433,13 +433,13 @@ struct hwmon_ops {
   */
  struct hwmon_channel_info {
         enum hwmon_sensor_types type;
-       const u32 *config;
+       const u64 *config;
  };

  #define HWMON_CHANNEL_INFO(stype, ...)         \
         (&(const struct hwmon_channel_info) {   \
                 .type = hwmon_##stype,          \
-               .config = (const u32 []) {      \
+               .config = (const u64 []) {      \
                         __VA_ARGS__, 0          \
                 }                               \
         })

[ plus BIT() -> BIT_ULL() in include/drivers/hwmon.h ]

and handle the fallout for affected drivers which assign .config manually.

I still hesitate doing that though because of the data size increase.
My strong preference is to add a second group of power attributes if
and when needed.

Guenter

