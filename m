Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953383DF007
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 15:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775834617; cv=none; b=AepP+VHYQ4Hyj0LKUw0ImHd7SMhRQciHFux0zll33hFfjqHBTlysUqdkAvPmz+BQDcJNrCMQtPS1y3w3jpv8eLENlKvhX8cw/3OJUtnc8dEC2jVL8V31TbfMJ3ZgipDG9RvTBaG7ObPZoC4TnM2Y935Aeb10X6SFrvO4dWzdHmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775834617; c=relaxed/simple;
	bh=qtiqpEGKt0oMmugrrXhPa7BnqHCckBI4a0HGqw26zI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlK9eCXwo5+dfdUXjQLpbBV69JJ+43TfUAHLvDJNvCxRnuZ6alhPEjA1RjRj5Bk9Z9bj7sS2DsDAu8PpUTYIVT0Hdn6KhJ/qMBFCugafLlh/E3wzTvpqbyq8LTKLzafLoOA7HRV2L78pdRqN53DvNGhQCWWJx5DXcQpmob9hOCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p6ackZ95; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6ackZ95"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12c1fcce8f8so1244521c88.1
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 08:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775834616; x=1776439416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAA6Qc2NYu8ctUp5Cpi98XZrHzLCmkZgBpA9eSHPmR8=;
        b=p6ackZ95DtVzlHMVlywT6GxZWtRDp3eCkcDtM1xHCYkIV4sA0o/c/3nP8VVIuuJXpm
         HkKDAl+TOT+tTI3977BmVQS5ogstT5KYAhGEPpDOWcmFrVZlOog6QwEPo8p7IsHavk+v
         O30k69vuTRi3TxR80WG2zwJivHLH8gKuh4AzOeS+7lruVlXmKxXlpKk7D2qEOqVsl4PY
         U045LntjD0gXw7l06xicGBVybxsp2rk8k1lpn8AxhEr14qQBGpMO9E8hOYUuGNymNXpw
         5J225UcrEF9vKQKZtFm5nfglfPuBy/n8G4NC3pNUSv35BbyE9k/vkD0SOAp6zxTnlEIo
         H3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775834616; x=1776439416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sAA6Qc2NYu8ctUp5Cpi98XZrHzLCmkZgBpA9eSHPmR8=;
        b=jWMHJwqQFuIu61n/Fvb7ZDKy+vlQopJv5jNl6E63AOjaEFau5jFeWiKYdRR1IXTCjh
         ip2ffNWYfeWkOYU+SRnu2b7GFQcOSqMHMsO4QKg8S+xhYPifVsHET+xCBXzQAL2v+0FT
         XT60EWJjP2EJ1xU07GS8A3rS9JFmxFJDGtOSomujG5kizTcyjCVZcwZM2smHmS4592ED
         wJ/EmaIJ6TcDNre6d7mMjc19x0db3qMutp4Oq3eNyRcITeRDPpN5RbkNnoR9bkj2hded
         YHKhUs0PpDbe9S7o6886k6i9Gjix9IzkA+HyiWOQ8zvE0KGRBLxiob7Q1yDghp695EMZ
         F9Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVqF0yMehY9IPDPPqxNdTKw7YdEzIgRf2hKt6S7YJVxEbUObm5kFptbSu5MctPWbfLEM5ezGYHG/rktkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8BMT6dBrwIMDyjCuKKsHg17vAnxBrXsxr1XPPKmHbzzBYjjWB
	bF3wEkDcVuoMNc/7uwH9HZSHLW67J5XqLc9xw5tNGXYS/X7TwrMSxnHb
X-Gm-Gg: AeBDieu/dXGIbYF7ELZu7HQWpiEuDTnJZZNfr9M5ydVGCBp99zmYqYy/cmZdCvwYxFP
	SqthJjc6WLOlUlivySL/xJNELJr0rkpZfKUVT8t0ZElKkptBh8eqA33UqFfa1sV6Kttz5kaqTER
	jiWve+YOKPrRiFKWlahxL4iAZS9UG51KmSISNfsEDyG9y7tsgu0W7fjTSJ27mYj5CpeNldAwaRN
	NjHhJwxmIefrB2+yPQzFpxXck0Jc+3AWDmTRQfyk/G3lUI4/Nc1nvvQqzSBhmIBNe3y6PxQrs+6
	4YhKII2xtkaOVBVoTiO3sRbLnM3pWCzgZIepuhacqNWyksmhIXYyQdwCj37iPL+Krbsqe3ASR9Y
	hgHsHgKpteq7RukSGSNjVY6Ys1UqnMVF2CK1GvrKkkIxGYtyXveN/4D4QYW0zhliTL88KjlCp2/
	RmGJDCYN4zhhOqnl1ysNJa17RJ990W9v+klaQV
X-Received: by 2002:a05:7301:1f10:b0:2c5:a6ce:e534 with SMTP id 5a478bee46e88-2d587b840fbmr2399500eec.8.1775834615650;
        Fri, 10 Apr 2026 08:23:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562eb05fcsm4701544eec.28.2026.04.10.08.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:23:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 10 Apr 2026 08:23:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: trivial-devices: Add sony,aps-379
Message-ID: <17343af6-0607-4ccd-94db-98c2285b9101@roeck-us.net>
References: <20260410012414.2818829-1-chris.packham@alliedtelesis.co.nz>
 <20260410012414.2818829-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410012414.2818829-2-chris.packham@alliedtelesis.co.nz>

On Fri, Apr 10, 2026 at 01:24:11PM +1200, Chris Packham wrote:
> Add the compatible string for the sony,aps-379. This is a simple PMBus
> (I2C) device that requires no additional attributes.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
