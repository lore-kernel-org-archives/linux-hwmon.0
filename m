Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2283CA481
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Apr 2026 13:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777296965; cv=none; b=q/Wp9/lkqxflfja2FidRJoXXI8Qzzeii2I1ET7TKaiAEmgTV//5yuNWFa8r757YihnJubRapMinBeGQjTvcGNDa4v6sPquXsdg8MroN/ObHOE9twOqbMnjvvLjWGoDRVtSUu8JDsAtJOzYL8Bev5F+vfEFyW/qw2W2mhLAy9BaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777296965; c=relaxed/simple;
	bh=9+YTaoHi6AUnV53wc+wLNAIofGBOoco2IeNrsUcHObc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KYq9fF/62PU/hO4dgG5M/dsjEc+Z4bMMmFPEDhD2BC3d5aKloNa7uRqx2+yzapVu9FqvZt2X2FI9gHqta2+mkw6YvwTYgGGXStkGhyb0Fq1wBJRqZqYwUOFNipBv8YGL8Q6SpqnBj3gDn+hrHKRVRodoiR/NPpNoZoGuGxYU2sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2RL3Or6; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2RL3Or6"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12dbd0f7ecaso189403c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Apr 2026 06:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777296963; x=1777901763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kxCTuEl8zowJOknqs6HeBONoTBllsQbaXXd4jTyNdMY=;
        b=g2RL3Or6CoBNClfLwnE/JqrmqGXpn1ilEGZeWczm6kX60qltjcKvhpjYzOMuFRuHtl
         C8pliJuPQ/sRDsP/fJwPerFHR/BURx58bMs3gtQAr9V4F06VdygqVAqxj2BC0h8tsQnD
         eAqjUIdR5Ltqf6IBU5rTaOsVtUAGdLMkVbnDXTiMGRLw3aJqwLq5RcPofQumXAB5oT7s
         LktujdU+SCdOxe9+3+GCdbplNkaBexh+/KbZUWOIUKdOMVeGi/a7+z7Vte+0S2ikSkLj
         8NT5LInIgpfJn9z1vO4o7hswBJIIEoB6uaEQBNLUWOiJkG9QqNVlQdhDjrma4t+Jsa5V
         X3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777296963; x=1777901763;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxCTuEl8zowJOknqs6HeBONoTBllsQbaXXd4jTyNdMY=;
        b=R90Y+ndTK6jBaZIv42uWUs1kr4YrC1JgMqBbC0Pdr91VSEFl1kNvOuPJgBrxtB9mMQ
         kEmFpvAZbqtY05rUHZPNgKTbO+sS+szydEse6QenTJm27vQuBoJ1e1Y0544BeE/IuE0E
         g/DxseeyJlK74q9i0ysWAbomG27yxd2pzvugvpdTgrt5RE3LvDWXWke8OxixXr7PAabH
         axxYehVWH7BR+r8Vzz6+62fo5bwPNYVYpYOh9jlZIW0Ljgi+ApmtZJEeDz3Fa6pw8G+D
         t2RquMVcl/DE3lLeKOAB5VpusP7HUXGp6Xzs/kMcRr4K2g/Ve3cqH+ywxQCY5pbHHyPK
         iW1g==
X-Forwarded-Encrypted: i=1; AFNElJ8o/DyGfZvRoe3UasJ0aqxOgiCAM/BLO28zbAyoPCtvLO3Ujzgs45KluD+63PIsjfcibU+7vV9EnIF87w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCCJPJrIN2hmbf327Mvy3jjlP9ksBQw141ZZZZMk+moBM12C9a
	YF+Cd9rYWXOPBw0OCFDyWowHbL5rE7KvZkiue1iMY02NS6BXCmT8HLEK
X-Gm-Gg: AeBDieseDtANSXDJmbb1uxCMoMJq76SapD1wvOrvLrokVlo9Qd9doidUDcZ1SQ/YUi9
	T4tHWk8/L2bDon7MuosnVddpOlobX43x+KjnJhOITBpD+NlFVfWes4l66lrf+Z4Dim/txhWzaM8
	aRSga7b6iwXimlFsgr7NODf6YFwDEaXXEzEiKIaDzHaBDTiNvjMC6bVqRXdJIEhPgX+C2roZQQj
	XC23rfuBZfQWvRd9P/p+SGGg8bvln+K2VXY0b45I7xl4J8uIGJjX51Ei/oKiPJH1iVMTm9ssRzN
	4sc6DmyAiN1D//7bYy4qxyhd+TXiUWRrPObvaynceUoNpeAjhDAqBDjqO76ApIciCj19vCXZtWv
	QrSYvRst03zqCMahGdwkRaPxv5MSsio8ql1GtOM5oHkewZPg3CfwDq0GwpcDIA3rCVuwN1uBc6K
	5NnSCUyrg7Stc8KmQ5AN2O7ceI4MMemx8sJrNI8Z2jZoU16BnoiOehqfurjRX4t1dS90stGNOTH
	7/GK8uxHaU=
X-Received: by 2002:a05:7022:383:b0:128:cf86:d1e8 with SMTP id a92af1059eb24-12c73fa708emr24734104c88.29.1777296962368;
        Mon, 27 Apr 2026 06:36:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm66978412c88.10.2026.04.27.06.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 06:36:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c59f9d11-d79d-46f8-b48d-9a2cd7921510@roeck-us.net>
Date: Mon, 27 Apr 2026 06:35:59 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: (pmbus/lx1308) Add LX1308 support
To: Brian Chiang <chiang.brian@inventec.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260422-add-support-lx1308-v1-0-9b8322f45aae@inventec.com>
 <20260422-add-support-lx1308-v1-1-9b8322f45aae@inventec.com>
 <20260423-free-blond-boobook-ceae7e@quoll>
 <bnyp2ct63m2p2ln52lnmrxjrh7bgwfcelekeptbj6j3vgygpae@og4y7ul7gumz>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <bnyp2ct63m2p2ln52lnmrxjrh7bgwfcelekeptbj6j3vgygpae@og4y7ul7gumz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/27/26 04:15, Brian Chiang wrote:
...
>> No properties? Looks like suitable for trivial bundings.
> 
> Agreed. Since there are no device-specific properties and software-wise
> this is a single device, I will drop the standalone binding in v2 and
> add a single entry to trivial-devices.yaml:
> 
>    - description: Luxshare LX1308 12V/860W digital DC/DC power module
>      compatible: luxshare,lx1308
> 
> The mechanical variant information will be documented in
> Documentation/hwmon/lx1308.rst (sent in patch 2/2) so integrators can
> still find it, without polluting the ABI.
> 

Mechanical variants are irrelevant for the driver, and may change over time.
Please drop entirely, or maybe just state that multiple mechanical variants
are available and refer to the datasheet for details.

Thanks,
Guenter

