Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D028F42E013
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783695035; cv=none; b=c2fohkgjw88lg8sJrcgveuXJvPID6N5Yn4fCov8tqfjgxddUyeQwcxf4yLcxAsWx+vBkD493wjWueDlCT6Xt0ermTTR4YRuOf4D4govlkc0Gg7G27Ukp6K+aoPHeHQQtg9ytZmy/ytRcQsnnrfjfdE6lrYcGO0rf+YGRYLrgK6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783695035; c=relaxed/simple;
	bh=/GyHDtjvQFjedcHXEDvC6MFal4jcf5suG+7c951oMVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHHy76ffyhvhVMt9Yo7470R22ASClkq4MVlvunEMLMLhK7VDR+KowGsPEWUsnpTOUiqDG2uC8CcH6itcA0eABvOS8YeRhIYEnF0sSJAkt5MkgAcdK9SfQZmlLNzOQdi6gxsFEglUp0mo1M4mWeVOP8IyoAfp7kcBUpd8AzDYZ0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6z2sEVL; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6z2sEVL"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8eff5ce3b95so8133566d6.3
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 07:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783695030; x=1784299830; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/wMIQHIqvpGohrBw2k+kM7bf7+q0a6yUHFC4gdhlqoU=;
        b=c6z2sEVLvXQ5FldpcqkA+YK++HafQimpA2c3aw5YXwQo9l9ui55P0vXVaOYXg/hl8v
         tjO9t1rdRoBPnZ/S+wMctR6OTYbScx/88SBbwySiBoO2VZGwV5BlCvZMzl6G1JaadLIB
         FYUbJb4p1uotatAFaKwzwH4TJbVFmioOGZzeArzqoXJw8la216qZBKwrdKHCgzYSdKbu
         7zsazEYFlWlAWkkOtYQS04V5TrBYxk3GIT6GxA7tFl5cwQRxG2dchIA5IXBA/p7OpVoZ
         zVFr5dGvy09HUW5+c6UwFTA/gdwBJDW5Q+wAIfAe+lGl36bUgjpMyzJ70MMQCLqvhlQx
         Kj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783695030; x=1784299830;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/wMIQHIqvpGohrBw2k+kM7bf7+q0a6yUHFC4gdhlqoU=;
        b=i54zbSQWqH8QMW1HZRsdL9cqezg5xdVLmYeD8zUMMqNC4L4pjaf5TTHdMZyC259ABe
         PYiQqbfnPIDoakS25z9RUXqz1sLebt4ZjbbZ4Gg3wJZXSnU6w2WI4J6X8RNYlhohKF6l
         aWE+4p42NtlWU7NCl51qwq/5zkUtg0fBiKgK6ltRn+pSSI6hXJU2ic+2CdpEh0MbAx4h
         Qd90jyRvTt3TcyToX9TU5yTxJhH5j2bo/LTyduC73x5OvncBfYphc31jViKEOkLfvIcn
         Srt7QZBta/DcO4rVqJepB9dCM3xM9VA/K49hjqTO/ATnGWJYcp4UgbB0ZRiDrYuXOCEh
         eo3A==
X-Forwarded-Encrypted: i=1; AHgh+RqS3nFrKgWtJNlOT9KA7f2bXDysgZhoW0TP7pmkDa3U01s2OhWfq+ZOqxK91Ai6vNSLtS1K52DLnMGvRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz32vNAzpxQlsXrfdVPHgRS4ET84g9yb1eEVyU+c8k9O3G6WQd/
	ZdwP7Qy1pY8vRRBFUliK5bVoz/zAAVWjKWPmYdCRkycgirPyvdM65vdl
X-Gm-Gg: AfdE7ckHvmsuyHrNSx/0ONh8dD2DEg2BnJN7U5/dM8T2RW38AHeR6IbPkE8buvwU6Ih
	AW+KaHGIJkdUjkYL65knhH8M/3p0tamnW7SXSwmnGMSdq2pGJOA1PRHJYKDT/VVs5ygfljRDnP0
	x6cPZDNKkhKId3xBs8+aPwuaSk1pJQ64LsUFoxD8EIjTFv91qDbKTP1uxebtXs8UtQ6T5jf/4sF
	IMovZ5+iS40TWZRuS3GJy0woIdiYRSxKrjIUBkffTVRrzUTwW7AXHr4a1HCTZjooeW1kWW2nEw0
	g8FHDrM3AvhPNWVJhFk+kziHyr32XDzGbPM7Yzv6mRk/0IDEqAqmmvwLpq7maxmKbAno1Np9Xu+
	Miow64Gn7Wpax/gqG4iHPyjJfnQzaO4SSfZc7aE/xqUegdYkVXkBL35SXMJjVcY8BRGjCgRHzzi
	fcfYbVZsKpTLpb6UWUK35kBrep3Q==
X-Received: by 2002:a05:6214:590c:b0:8f1:ae38:1beb with SMTP id 6a1803df08f44-8fec2276b3cmr143145796d6.32.1783695030456;
        Fri, 10 Jul 2026 07:50:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd80fd492sm44739756d6.34.2026.07.10.07.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 07:50:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 10 Jul 2026 07:50:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Maurice Mehlhaff <maurice.mehlhaff@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (asus_ec_sensors) add ProArt Z690-CREATOR WIFI
Message-ID: <4eeff1a6-2b92-4af8-864a-ca9eff3f23d5@roeck-us.net>
References: <20260708195638.1324168-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708195638.1324168-1-eugene.shalygin@gmail.com>

On Wed, Jul 08, 2026 at 09:56:26PM +0200, Eugene Shalygin wrote:
> From: Maurice Mehlhaff <maurice.mehlhaff@gmx.de>
> 
> Add support for the ProArt Z690-CREATOR WIFI board
> 
> Signed-off-by: Maurice Mehlhaff <maurice.mehlhaff@gmx.de>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
