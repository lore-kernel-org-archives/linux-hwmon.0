Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65512C0F64
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455126; cv=none; b=jQtJZvr0A8d5GBfHhwzSC/AyBzsFsIxysjcjPiHEHi4OKco6jMRqL3wNpmHnSGPwTRCyPtEYk48j3cAQuilTyo4XncoHxxcCItON51/VDlGCK3Gjml7zBsA7l1hf/xBrudjNF4pC8v2SSLmd/JyRwKkdg48/7Q/7YZDHuG7xjxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455126; c=relaxed/simple;
	bh=JC60HEInNluqzF3bnchV7EOp617mC62c6zir/e0gnlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPmoe2q12vaXS7o6wpQrb3ULAMsOKLuVmMA4KI34ukfu7SfYryemOfUSIi1KP2SipgUGg/1DjKEWIi6bUpucVT4Ll9YM5AVJyl5QUbyLZRNY1mL4TH3k7rPZoEBR9l5kS8Un/ovG/OUhgQijzUuwRppB80lL/uDZWVTn/dhvlTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwFrN2YG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwFrN2YG"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-271d1305ad7so86802455ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455124; x=1761059924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9RG2muNaSakDWxI94gPRyAVmL2U1gaeN0a3vQP8Zu5U=;
        b=UwFrN2YGIv3vI5HCIqsNtILexdt139q6LdscQO/XGkyIPzkkZMwu2pie4wRdr9FvQC
         2OwsmvlgG0/wLVlq4PEdF7/jVE3llgJc56KR9H7D1VyCytivjE9hM4gbSb74YnbH/h2H
         OUQ6ENszTnII05N6TeEmS+f3N7SQpBkjRIY22r4cjc5rmnUbMZuVG6AGNGn7pX8mMNwE
         yCMEGRRaIcMpGTwxWVhS8d/thUB1nPjpotGuiZgnr8tXRRq6MuwA7dDl858exBOjM5MC
         r/zzZjEhhIOTlP2l8LdlAcmwg8YQizEsC8MQtvttoB1uKNol6qsMSvXHdNPjzu9mT0g6
         2TLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455124; x=1761059924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RG2muNaSakDWxI94gPRyAVmL2U1gaeN0a3vQP8Zu5U=;
        b=tpJ38+GyHqMlEpc8Eiyn+1sz34SPRNtGZlZC4KBBliJ/WV18evu2Kl9iYPcy8Wr0aL
         WFIsiyGGJQy0RnGmY8nfsZuq33qQaWD/zaNPP3X1A97TndX6hMb6+fZZHgfLQ4iVNkwc
         PfGkXzHBcCsvQWTUk6W/f05tELVnxHGeM9oG9Dql8SH9rCAXakWBT49oCKu5T0AkCbXw
         EWwZnDF6z5EqeNG2BGhG2FJ/tYxuGt0zNc1nS8lH6UhDCqXkew4v3Qum0A20uG9nG+j2
         eWKN6P7r8lbgm/X4qCAdhpPPGmhcEFRTUNm7dzzv8wZ+E7THsBR2S2ztLql9c6tS/Flq
         blmw==
X-Forwarded-Encrypted: i=1; AJvYcCWpSqv1BzePV8MjSlxMEYMf7OHwWne5wruDD02bjklKjEqjZtJrXwwauIe0F5sJ2aIncM6IFosvRl4ITQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjBpmK0RM9L3Dah8VkcNUBKaugWLt/EW6IaWY7F+yno1ZXEuOc
	8rayisDBBPLl5Bwd+fEFd+e9G66SaS/lDkYKHEZbySQ3E1BDV6vcbNA7
X-Gm-Gg: ASbGncsgY5/YoqUytav0HMXgh5YcHikA0pWIUHGNOnE3FkMvqu5cSGiH6skFUBbKlJ9
	mpqMvYCpTQzb2X/iZPoGijYZL3fmgxVVlhJmo1AVlVKN/sYwEWSR74nKXeOTNL1i98tPZp5Tr5I
	J3nDxYdrTYO4eUnuMKihgOqvBn7reqTpMcuW4UvnMtVVEo1ijlUTNT7nP3Ewn6cfa2PBqBKic+C
	4UoFxuaCvXr9OHyvUwikZVznokEeTZZ7Cqp6yfw7oScOFg9CyqNiBWQM3uZ9+5em5DUhBlJd++q
	srHt5nJfCJniAXa7gCK+uMg9HM5KH4uuEwD5Y1+slQvnwr/YJudRIY24/hYoWmU3vPLKGWA3SVM
	THUEdD+N5U99INtJIhadk29BobZKEb9xBnEFv3znjF/2DNJf6nQd7b5GMLjOHVAac
X-Google-Smtp-Source: AGHT+IHIsEd1SylS40HYfaucznmGO/M9RGsNWRga99P+rm4jbrckX5mvU1P7jlaSDBhOyjB7a0ocng==
X-Received: by 2002:a17:903:2ac3:b0:281:613:844b with SMTP id d9443c01a7336-29027418ecdmr315810205ad.52.1760455123527;
        Tue, 14 Oct 2025 08:18:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e1cc53sm167544325ad.46.2025.10.14.08.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:18:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 14 Oct 2025 08:18:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cosmo Chou <chou.cosmo@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, cosmo.chou@quantatw.com
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus) add driver for MPS MP9945
Message-ID: <7df1419e-18a1-4656-aba0-2f82914bcfc8@roeck-us.net>
References: <20251009205458.396368-1-chou.cosmo@gmail.com>
 <20251009205458.396368-2-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009205458.396368-2-chou.cosmo@gmail.com>

On Fri, Oct 10, 2025 at 04:54:58AM +0800, Cosmo Chou wrote:
> Add support for mp9945 device from Monolithic Power Systems, Inc.
> (MPS) vendor. This is a single phase digital step down converter.
> 
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>

Applied.

Thanks,
Guenter
