Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323982D3EEE
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 15:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773762750; cv=none; b=PApbMuzKlrb8em8EgWTEL+syRsT06Ug8MCz1oul7A55o/jFZ5fhDEzahMcKqa4edKH9oE8RGDlsiySChGG7ky6q+HI5id8Wu6+/QRdvvZnqqsNy3W31LoZwBBMjxX+jWt2VfwwN5NjheMW4ptZ9MrEx3zYRVfbV5D9vYkh/Gpb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773762750; c=relaxed/simple;
	bh=Qafok4BcLvXX6leB3jlwOhS3uoXbRhAKVRLJJH1cOe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uVY9TiCJPh+X06MKkz88qo0yn/KPQOXOr4X6omg6kmsxApNSo05FcYnculSrFktxay2X/8PFlaX2ol6ZyWSJlAlqNvLViuugb+lZ35ZM+T3WfxrSmJntx6VAW0xbM97Yn6oe3yD55r5tOCdo9Cz1wQnv99zB5e3o5Gqe1vIi7qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbV/nJM3; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbV/nJM3"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c74029e07d3so1027748a12.2
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 08:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773762748; x=1774367548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=P+y9YdrogNpLoQwIFH0ytH1KlQ9rmz5lv65z1SWo2MI=;
        b=PbV/nJM3A2rJmz9iMVCDjKMWueKHfY6ejpvljglscf+/N+i/K7NvB+m1wrrrXhOD4k
         or0eoJRUnAY0WzSDxdfAqREKdNprtg7kN/G7qrbKS+/xGEStD5hy40n/ES9v49fNXjwr
         rqFotO34B2W8JMJBn2d/iX/Zy7MjqeY13Kl4ThR0fgF03g8oqBrFpgvsF47bnFkhfdpZ
         +LKrhuFC+Gx3A+BxJwgbYMLmhCX7VqkixBdSka7inpgUg2TeJHCmxkKPqJ4PTNUXHJ8d
         yRc9zrMqyjUGq5/KiDMlJQ8JkrDXEbV4AMDGLx/D+ljESUbMv63/YeVBSxlW6HVaAsvL
         Hlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773762748; x=1774367548;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+y9YdrogNpLoQwIFH0ytH1KlQ9rmz5lv65z1SWo2MI=;
        b=TnkGrcv14fiArsS1ycBJ2ITrYqTlcf7OepV2fdxeB3i+fnQMBjDRBngLdENf5FU0xm
         hySh/QqBqkKwPH+pptJliHd1HFkLE/v6blaUWtgDEpNiFgHS5L620mOnfOvK2pXqw9Yl
         OMlRHDzKWM3xGTGIp2ztgFxhkqzorQzBg0YVY4X2ejpgpi9fFT8V7b75gb+b5sXf7Ra4
         m/4YegFDTcVTU4gVl0dZeqfpKX4RY8HKxZOO5pZODl/lSbxylC6s2yBcQRj7pFX3ma6Q
         zuQYtKuZ98FqDyYAnT3RT24/DTV77o15iuHcPDhRE+Karkju6LOhTCDnQTMZXVXhbfxP
         OpDA==
X-Forwarded-Encrypted: i=1; AJvYcCWnqZxAeCJzLu0Yed3SGdenN76TAeUBESHk7Q6vbHcJ9xp6+zostaxRHwOo2isncIGYntCCw5nzv2yBVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdC2/rAntOqgUj6rOo8ivIBxiLmiAn7CLJ+Y+z5YIwmw7DZXJ4
	OkQlJmRA6hbni2P5BWsjJZlcqlIrUrXRIqa1oodspg4FS+7jZ8WdE63L
X-Gm-Gg: ATEYQzxy+c+g+qFKhGS+1AshvWPg+V5TDlVKn7qKkpMmhGutEBekDGkyZtQ0+uKAjgL
	2z0c028x4g7ALfDtQd1zwin8d8A08tCUZluxuyALUcyVpVh6pVoP3dfpJ5JVE8fGOxp/OhSiU4F
	OaLrspGtHHpkeyPCjfBGpXqQShWet8B55vrQf96gnNBq+wMDFNYReCLT5sbzyxqz/PU2U8A111r
	9mPF7wNdbFVAx74nAtrieaQNfRwsl+zDo9/1xeBqmndsVhd+oXS1a/M8FKSHATeYpIeLP3G/53s
	qAocMQEwsOtaobhWpYyxq8fLbljiHhr8y/pT+Dfn+DjgPd//J9VlVPqKZlgQHtrivu1YwtL3fr3
	NF0OZJTSO2iFaJyO5uxjahxIZqFYA9/1ECTMaJDaVz7b3FnXC+u9NUKSsCg+T8d5uZzEiU4O8/1
	R7VpHQ3TaOxvhVR3a/wPlkesaTgJr0ywg6VMX0nPqCmuTBkMYwFjHMZx86kNNPT0WfW4Cvr4TJ
X-Received: by 2002:a05:6a21:6da1:b0:398:7d6e:27f1 with SMTP id adf61e73a8af0-398ec9fe3e6mr16758219637.9.1773762748436;
        Tue, 17 Mar 2026 08:52:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e0b1ffdsm43619a12.7.2026.03.17.08.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 08:52:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <502ea01b-e5e1-45a2-b5f8-ad236dc8f006@roeck-us.net>
Date: Tue, 17 Mar 2026 08:52:26 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] Convert most Dell WMI drivers to use the new
 buffer-based API
To: Armin Wolf <W_Armin@gmx.de>, Dell.Client.Kernel@dell.com,
 pali@kernel.org, mjg59@srcf.ucam.org
Cc: soyer@irl.hu, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, mario.limonciello@amd.com
References: <20260314175249.16040-1-W_Armin@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260314175249.16040-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 10:52, Armin Wolf wrote:
> The new buffer-based WMI API improves the compatibility between
> different ACPI firmware implementations by performing marshalling/
> unmarshalling of WMI buffers like the original Windows driver.
> 
> Convert most Dell WMI drivers to use this new API. This also
> removes all ACPI-related code from those drivers because the
> new buffer-based WMI API uses abstract WMI buffer objects instead
> of ACPI objects.
> 
> All drivers have been tested on a Dell Inspiron 3505 and appear
> to work normally.
> 
> The last three patches contain some misc. cleanups for the WMI
> driver core itself. The most important change is a fix for modprobe
> to verify any WMI GUID strings from WMI drivers and convert them
> to uppercase if necessary. This should fix autoloading for WMI
> drivers that use WMI GUID strings with lowercase letters.
> 

The series doesn't give hints to maintainers if the patches should be
applied on a per-subsystem basis (i.e., are independent of each other)
or if they need to be applied together. I Acked the hwmon patch, assuming
that it will be applied through a common branch. If the patches are
supposed to be applied in subsystem branches, please let me know.

Thanks,
Guenter

