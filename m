Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0097A1E4AF
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785200157; cv=none; b=H38afGa6hzWYlHi2+M26xO9uXloVWY86SnikS+7DQ2ZzYRvGeCsYueDyY5qSWr2TyM/6Kxdp8YD6vShX7S9j8nYC8qWCC8hJU2KpGLC5Z8kkDXAa9JI6h59/2ubisMFgrVuD9HbhejfT96ZFsB51jw/BiUEwpg4nvq0bY3ZJwJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785200157; c=relaxed/simple;
	bh=JComac+VLU3JoVnygAuEJkU0t8i2FGW8LqxSOHEMfBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bwWqxk3qYz7XEx5LJGMOEabogY9Cz5j218YqyzGAA3EMUdQnm4f8VN9Ny7rJtjrZNY3fg16P4e8v0HctjJrQbBUiabScx3JfG6vJtgzx/HrEccG7XOTOHANdrN2eIbX+EbAv9fBzFLStVeMzgnfUzw/tO2uAp5OLHHGLn5UPqBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEBlxlds; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEBlxlds"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso2477254a91.3
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 17:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785200155; x=1785804955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kI/gmOWjMthg51/t0Gt1j3IWShKKpCQEuAUUggh2swg=;
        b=sEBlxldsSgaAlJ9kz2MSv/o2JZr2erg/Qan04ZBIIql4AK5Ack2cUfkk/tbDNRkBhU
         xUJQ25t31aBs1Oy0VDvc8R7aea6fMZVKPtJguYwWkU3zftbUwBtP4fy+7fznKTP1uxn/
         tLQvVDJdcBlelIk6UIpW63Gpc+UyCrhb6tykqwWxodZxyQleMsh/lD3dNeCnMeAKNaMK
         FHe9Gb3y8dPlH2LnpWGgwPHt+DEwsPYco3/hV5IiqLV8a0q9o3fqOI9Dk+lIUjJzWYuR
         kSnGpj2Yk3bPFhvJKvRmdWJj0xIz8MvVqeL5RXXgHr7ABrd1af/Gj9jMwZZ4tjycOtqF
         m52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785200155; x=1785804955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kI/gmOWjMthg51/t0Gt1j3IWShKKpCQEuAUUggh2swg=;
        b=kc8gFYsc+j4x3vDTghz0OL/8NZXT8h7q2clrHVuQDLBVN/b0xknmVkMzwxpG6qclyT
         siF5Jl+us34lURyxk7b5743D57bv+tQDsTWCVTl6cBJljysJA2kBQiVSbvmYicao3OwB
         VN+wVb59KpgwPnc0TVU/9+zwvIdoIJ+le1ThyfbpYE5x8Fc6m0Yitk+G+H9gci5LZMBh
         JeduhqfJUJozJ9apEE9TZznZ0FipaUbxF0q4nVw0/tyWEuVcbzBN7sEuwRniHUtmiqGe
         zCrn+vJJ6GSkMwJYnvzsOXdiQxO5WAR0rk5GjK3PvTbuQh47sJ5SmE1MI6NI/AsduHF+
         ktuQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxhN57Gsmg3sSmvXQ8CRoLUGm17NwB9AaiwVt7Ayna5LLSQF6j+AUQXwqzij5T16wHOy/Fqby78koUHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwECTSLd254oxD6pj6amXA/tOuiVoQCj2MExZEH6ixMxVdFjebB
	rZxOrwbkt24n3ysyrOVgm6KD5TlSDbCA0PTtdBkQKPmj42o0Q30darmN
X-Gm-Gg: AR+sD11/1eH7O0c+NJETzOFPwMmLM4/tfR6tvZmhIn3lOThhFfXl8cHGWVRxr2xo2C2
	xMBoNcXez7vLuC/kESc/FVYfGDnNqzrHBdujb3/I7VDnV1+H+59aTIX2ujJ66oYLn7Ch75eObGt
	wjRbOvI54zCTRmouNZY4y4deJvPSzfqkikTI7DFFUeFmOLm86NAH8VNTDVdVnaUYq3CR1Rr2PO3
	pbZrg1LE6qZ+tuwtcUFXcyk24cMi0SPkhFtVKcbRblNvnzDNxQi2T81WUs9zJSIhgvY39UEUtJ1
	CXjFd2SoQEej2cusVJp7plvIgIjdACTsL2HM7BWSTZSzDBECDcj4hvjhocd1IpdstAajUroEzs/
	zIRwmPRqcpY8tLbA1KQndgjpx7mOJAVY/YQGQpNosQQw00VIzajnfr0HPtI3qU7mkL2PehDOVjI
	QKLiGQlUBcV5q54RM7npaDYkwbwwIX+lK7hz8V6TUr281Yr7g3K0C2xVUG/9QVigKNhx/ip4VW6
	A==
X-Received: by 2002:a17:90b:4c0f:b0:37f:a915:1c29 with SMTP id 98e67ed59e1d1-38f6a498a00mr195055a91.19.1785200155199;
        Mon, 27 Jul 2026 17:55:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642fbf74sm481558a91.17.2026.07.27.17.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:55:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 17:55:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Darrick J. Wong" <djwong@us.ibm.com>,
	"Mark M. Hoffman" <mhoffman@lightlink.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [hwmon PATCH v2 5/8] hwmon: (adt7470) Fix temperature alarm
 logic in hwmon_temp_read()
Message-ID: <372a2697-74b2-4612-92a9-b4370327f5a0@roeck-us.net>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
 <20260727-adt7470_fixes-v2-5-598e38a46ba6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-adt7470_fixes-v2-5-598e38a46ba6@gmail.com>

On Mon, Jul 27, 2026 at 09:22:21PM -0300, Luiz Angelo Daros de Luca wrote:
> During the conversion the alarm callback started interpreting the
> channel index as an alarm bitmask, resulting in incorrect alarm
> reporting. Compute the proper alarm bit instead.
> 
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/r/20260717211224.B9E291F000E9@smtp.kernel.org
> Fixes: fc958a61ff6d ("hwmon: (adt7470) Convert to devm_hwmon_device_register_with_info API")
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Applied.

Thanks,
Guenter
