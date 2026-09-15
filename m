Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635AD49B1E6
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484297; cv=none; b=Wz+khjDJOi4RLMVdE02JIZdDU2pv74WKRJqHBgODrE0bYmIT/oxkCEjzxU9SNuohG+xwjyh394I26X4hKPmM6xJxYG/yj5sD1qwdlW0kQhiKHtAWyZlcDbIOf03S3TQgteXaw4VnBNOddvKbcDwDxnHOJIG/00s6qAmozVOZlPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484297; c=relaxed/simple;
	bh=vH2fPTiig9KsoIpPmpgVTVeRLyxg2yaHTKlPirDTq0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FT0Ah5tpaH6SFweH3WlWWv7iogwCVCffZNWVrVv781oWP3A0seDMebv6mn4f1H2/zBySOjpSlvFNqs+6/GlSGYTUbqbDqHRGIEbA2jhfIxU6z+rW7kkz9aSGZsphumei3RSacQi5xRS5QUoEM+SuIGZiOxbctEnoq33MI9WE134=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8DoEr63; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8DoEr63"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db22383fe8so24012545ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 07:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789484296; x=1790089096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xf41xLZ5GsOR+GrBw+a2u7qUxMBmodQqHK6uS4KMUCA=;
        b=Z8DoEr63CZx4BjisG2cNi/X4f/pAScvrZoCMzNpFAJdq/+f9NHNosBv9i6oGYmtV0g
         JbGCLkstJskGCdDFEa+xdadyeLKUO175Xxgrnu9jGMynHIRF6QR8+LQE5ty4rHRleqNP
         QpTTKLxRML477OEmUpv3bMRNuZ4Nkyi3bIVn8ZOH2mZCYLqZ12h/aFp1vNwp79lSQqgW
         RrkMsWXujeSiL/o4RbbfFrap4BbqlytvxFtj49NmR1iK2zW/bOi+j8eaKXAjZ1FW+uG7
         Zsnxke5IOPI0Lbinbj5o+/LYTAPwnvXZIjTUBCRLzCpdjACSHIRozAgThBVPYQ47WtH4
         HkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789484296; x=1790089096;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xf41xLZ5GsOR+GrBw+a2u7qUxMBmodQqHK6uS4KMUCA=;
        b=iLjgGHADyl3xVK94P8ARllrCzhTtmyjB5XiXLnoYTwmkB/JHSv6L0l6remPuktbJcN
         smnDn711IgLcbBX+EL1Wg79matqmR8ebEyI4K9zTezSgra2/ZYhJpo5+6J7nSawTaQC1
         2kYj1vP9zXA79JEE+vo1a3KNMc4ogzRwWpRMykvWHh6Id17SeyDnRwbPjSGYFBszqbP0
         dfap3HfBgEOj35ZpoDYzM9krmnlRIF15Zjx5jrZaHnQaZrW7M1X66kX6TI7MnavH5398
         dvTZIXry7Q5TJ7efpesW0Q2zc6CEbx8vaeVrTrKQ8c4K9RRM2r1u+7xCHRSUGhstBgzX
         LHCA==
X-Gm-Message-State: AFuF++mBOFw7fEC9nYUnxnQt4/KLCAFlgfT/lA0J5v21/JHMU543dmfk
	kFzpySwE4eVx/vzS+fj/EcdFx2ZMPHe9qQYlcpTpk67N37gwBpIravIF
X-Gm-Gg: AYBFou0ZGvAnyjp7WrvIw/IlvuXYHbOnjq7ptE2mQVprlyLzx9FH7DA8oLkM1SUrEIE
	1ZRZzLH02T00V/WMB33n7VjULEHGA2beiUKaYrW7uIAhUpFP9Y2i+Hkeey43V5HofXkTrAcMzJk
	NWXtyE4jpsrVqERgkucbz/0Lm8SjsJ3X8wKBOA8WOpuB/ZJ0/dKV9F/Bd0o0yySXIdlgttxvTYb
	+H2FwG0H4CG4vknsYsmq3Cm1ubsmvXJwKoM9u6gsqWkx4hLse8rBhOyrG8/pXV761dk69ALu21d
	rL1Z1SS34LzJM5bgfnb/ae2z7xIoq7+hhFtQ3Tce5R7Uh+IZpU0xdwP61R4o0ToUHY+q5chK7eQ
	+nlCpb6QCdmsgyFJk/6gMRU8EkIm+wNPv39HtOLZqvG8Ey392eQa/r/6zXeSjSaMfjqOTo93toA
	4x7yaj9J+jrwwFN2mDH9kwb0NU/F1qfdbsnELh0C9xA95/yDhK3KPCZwrLEkuK/WB2CoJeMXK6J
	LCVMl51b355I1ublZKDZythjFhAhBJIHrSMvFhGRqdGUXgt
X-Received: by 2002:a17:903:1b47:b0:2dd:7549:39d0 with SMTP id d9443c01a7336-2dd75493c43mr118047695ad.18.1789484295488;
        Tue, 15 Sep 2026 07:58:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb3bd7sm68613625ad.34.2026.09.15.07.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 07:58:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <70746c77-e113-4bc6-93b6-7ac6027c86a4@roeck-us.net>
Date: Tue, 15 Sep 2026 07:58:13 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: use named initializers for acpi_device_id
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
 Luca Tettamanti <kronos.it@gmail.com>, Cosmo Chou <cosmo.chou@quantatw.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915-acpi-hwmon-v2-1-39d17c748eb6@thegoodpenguin.co.uk>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260915-acpi-hwmon-v2-1-39d17c748eb6@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 06:48, Pawel Zalewski wrote:
> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base. Also drop explicitly setting fields to 0
> where it is redundant.
> 
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
> 

It also replaces pointers to empty strings with NULL pointers,
which is a functional change and still neither documented nor explained.

Guenter

