Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B681A199949
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Jul 2026 14:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782914864; cv=none; b=KpjUflehI7kEubZt4qK0rdzyXu0NjDgoFfN9lF0fhZjnv51/7TevpefU7c+E9NYJrFiqISbUqHsyz6kpEYGjkvnIz2w3Ai10HCdqCrMQmjm/cPCWjIskrz4jHzKTdFH+8U06hCimhgUhuygX4LWXwh5dSz+tBxg89wMqCXRo/t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782914864; c=relaxed/simple;
	bh=SkYBEpbjqOZxUGc7QG4RqBkayD5PvlrnO1BY/nGQSu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RamumJX2bFnyMvOvfPX6dLvz4X3Lay+GrQOSCh29zR5ipe/zKsjt9nrlRSCcCxkBPcS19p/OQO4Jah9iEN/YvSp92gaV5rWJ63jGs3756kXSnCG+aLKxRICbraX0Gukmm90CPodNAyJLx3lf+t0oXgKWLsUOximFWYdhbpegTkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jb8Munhw; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jb8Munhw"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso526144b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Jul 2026 07:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782914862; x=1783519662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4t5eL4t0fhdWKpboOV6idGNh3csreO6heKw2RXkWK9c=;
        b=jb8MunhwXFx20pU3bULB0Hzj3jyhYMN1TboJBwor98t+3Zjqsm+ILxweZorNy8KQ9s
         LFkqX+8r2YYc5Bis3caMxcYMN3E2EfKqy2060Lm50OupPoMKfj/g+t49UsAuDZuJLvoA
         rzA2IysFgEnlR8soFppoMGbj5HdLfSnh/Ohj2mbAtWP82/vE8F2LphpNOtOkImvy1S5Y
         qkuqFm7gbccnEvo/zgtXxAp2QG6SxzvuddupUK1b1TJ+R+z2oTJYe35wdNrtP+HX4Oyx
         o7lfFpFHGd9jXcQk6ymalvjXvbg+E7b9y6I1FL4BQE5/xFkSSSGd4eyQtJ9X64YpzYL5
         dqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782914862; x=1783519662;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4t5eL4t0fhdWKpboOV6idGNh3csreO6heKw2RXkWK9c=;
        b=LRzMkzE332Rl6z4as+Rt9zpDWQdZ/LKQhw4nlYIoD8PN/bLS6hgaVU/BRsg4Bku28u
         yuXg0+svP76HvK8bT0kP7WJcf1FKTDlZRCzOle9gzqFCqMXybpPMDFjeoaDCinoX3XoO
         4UMhHgpklhfCXrcG0N+DuX+EKMm1OzpfIxYzVXSfwZxT+PwylwNyVPd6pnI/dT3XUiDE
         7eh9Cbw8aCyZQX98keAxODWqyshZxHtuv0xhXaVIqxmTjycJOjEj7GyoZp3PLmgPQkWP
         HLmdZIIfo1PWYZFlv9LO+eLiwfZsA+WSiZ88yO6LFkQB6Bh7UpP7p0yx2jO06twQf2mw
         WW9w==
X-Forwarded-Encrypted: i=1; AFNElJ9gIAcNx09YvtKfhvS3wWjWF0HDp4NSn1uOoqYvjOrRVqOVjpIUCQ9BKJpgn0dWWizjKaIpXzlqkSGM6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoRzG69lgXXpbIW1hcCPHqBA2V3oDmgrVNRJtkRYDsUkJ4/fds
	tawpvVwRUNtqZVGBgDt5PbDmo4kuaCYS1qpm4n4iNA8gTgGh14qUOl8p
X-Gm-Gg: AfdE7ckmHq8uoTG6tL/VvcyXfJAqO4TJOFqwVT18GTLSw7ksUyaWcTYaiQA5jRWjF1v
	/6DTdGUS6wN2TjGQhzvN3+IOhjy3Vx4ego8lQZV2gzr+ezojRBkIB1Vc+6yl11vWCJysM+uEmAq
	vQITXH5fefoTEM5WHiKQyQbf/XvcpjV4hBjwSxJh31fMSTbytaxbjoQWAgwjnA5AZij0AM8ngLk
	O1tO34r2Ui6HZgbS0zcolbcKzcG7pI45vot2BHLfvqW0XqZJBjDXVMtEbSQ2oVHmIR5lS0zopZn
	U8yegd/cpKi7S2w5UdkMySB0w5JmJ9TF/MRNmLuwjJb9/tl0ivGdSeIkqDSfifOrSmNpytAnjO2
	cY0fYbfnk+EsC6h+4lK+TamyWAaL9VCZj7kkT5RJbZNn2f1gI06+a5GkUfz/VyKni3tInSuGhac
	o3yXXa+eani5Orm3gJY5VLl/jUirSsRJy4utkhiGLxlZJX2C4vKbwnzStWPoSebQ==
X-Received: by 2002:a05:6a00:94e3:b0:847:9aa8:d3bb with SMTP id d2e1a72fcca58-847c074eef8mr1721257b3a.12.1782914861788;
        Wed, 01 Jul 2026 07:07:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fff4c7csm4145210b3a.16.2026.07.01.07.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 07:07:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6370a4b3-9fa5-47b4-b53d-7b8fb6d69de4@roeck-us.net>
Date: Wed, 1 Jul 2026 07:07:40 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] hwmon: add Altera SoC FPGA hardware monitoring
 support
To: tze.yee.ng@altera.com, Dinh Nguyen <dinguyen@kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <cover.1782715159.git.tze.yee.ng@altera.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <cover.1782715159.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 6/29/26 00:24, tze.yee.ng@altera.com wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> This series adds hardware monitor support for Altera SoC FPGA devices.
> Temperature and voltage sensors are accessed through the Stratix 10
> service layer and Secure Device Manager (SDM).
> 
> In v1, sensor channels were described in device tree under an
> altr,stratix10-hwmon child node of the service layer. Review feedback
> noted that this is not a discrete hardware block with its own resources,
> and that a dedicated hwmon DT binding was not appropriate.
> 
> v2 removes all hwmon-related device tree bindings and DTS changes.
> Instead, stratix10-svc registers a socfpga-hwmon platform device when
> CONFIG_SENSORS_ALTERA_SOCFPGA_HWMON is enabled, similar to stratix10-rsu.
> The hwmon driver binds by platform device name only and selects sensor
> channels from hardcoded tables based on the parent service layer
> compatible string (intel,stratix10-svc or intel,agilex-svc).
> 
> Patch 1 adds async HWMON SMC support to stratix10-svc and registers the
> socfpga-hwmon platform device.
> 
> Patch 2 adds the socfpga-hwmon driver, documentation, Kconfig, and
> MAINTAINERS entry.
> 

Sashiko reports a number of issues with both patches. Please address or
respond explaining why the reported issues are false positives.

Thanks,
Guenter

> Changes in v2:
> - Drop altr,stratix10-hwmon DT binding and intel,stratix10-svc hwmon
>    child property
> - Drop Stratix 10 SoCDK DTS hwmon node
> - Register socfpga-hwmon from stratix10-svc (RSU-style)
> - Replace DT channel parsing with hardcoded Stratix 10 and Agilex tables
> - Rename driver/module to socfpga-hwmon
>    (CONFIG_SENSORS_ALTERA_SOCFPGA_HWMON)
> - Add Agilex channel support
> - Fix SDM value conversion (Q8.8 degrees Celsius and Q16 volts to hwmon
>    millidegrees/millivolts)
> - Improve sync-mode error handling via last_err
> 
> Previous version:
>    https://lore.kernel.org/all/cover.1781861409.git.tze.yee.ng@altera.com/
> 
> Tze Yee Ng (2):
>    firmware: stratix10-svc: add async HWMON read commands and register
>      socfpga-hwmon device
>    hwmon: add Altera SoC FPGA hardware monitoring driver
> 
>   Documentation/hwmon/index.rst                |   1 +
>   Documentation/hwmon/socfpga-hwmon.rst        |  34 ++
>   MAINTAINERS                                  |   8 +
>   drivers/firmware/stratix10-svc.c             |  46 +-
>   drivers/hwmon/Kconfig                        |  10 +
>   drivers/hwmon/Makefile                       |   1 +
>   drivers/hwmon/socfpga-hwmon.c                | 596 +++++++++++++++++++
>   include/linux/firmware/intel/stratix10-smc.h |  38 ++
>   8 files changed, 731 insertions(+), 3 deletions(-)
>   create mode 100644 Documentation/hwmon/socfpga-hwmon.rst
>   create mode 100644 drivers/hwmon/socfpga-hwmon.c
> 

