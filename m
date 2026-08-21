Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF7538E135
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 05:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787289109; cv=none; b=e/c5rXGr+ZPEjUykb/Uu+9XsBKyqa4k1kZHvHTz3vnS5BkEPtRat6ck2jEGGpYOqryjZWu1uHCSqJmTjjltT1CFZJJ3G8wx6C4VB8ivAIk4KndyRqWO63pqDMIw7h88uRa2UiDm4r6o0fwu9UQrKKWy7veSK4vSeuXD6NnoSxsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787289109; c=relaxed/simple;
	bh=bZvVQSnxR76iI7o1poNB53jNw7lo8Y9/UFOYVBgoxug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CWvr/olBMKujTNl9dhhaPIfs11/XeZ8rZ2vTrWFAqJiGtZ43kSsCdfiKx6izJVEve0ePM9K1+ZuINNVXraLpnK46735amNFWarYmyNpTim8pGEixCJTsQefQgoFQMbLKrFC1ZxPY3UwMZHn5s/SvFGIQ/UGKbl12SVGJZMLExaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyTY5s0p; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyTY5s0p"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca12086c06eso508038a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 22:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787289107; x=1787893907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q7qYNBjYJTarZ0aCh0RmYHP1Sy0FJpXklQmt60ZqlDw=;
        b=CyTY5s0pbXK/XCdmtBxgUUEOY8obD+KVs0SF5sGwZBcuLBa/nCAZgq97s4flDv8LiX
         Z4BzCrwha9V4h9ad2JJuEtbYg4qvQ1JLCADzP3kKUKT2r1hbI46lxWfKS+xaIdU+5gQR
         AMaD3TrTKQ4a8nVTqFlVbmz5gI3heluBnGT4DeD9NekVQlwcZlL6z/u/efcy5yJrUpX8
         ANyYmAzcb4FzZAHbABdLV/LKLEoZOO8DcABJwGOWB3j+K/eGtjO5cUiT7za2oKywBvk3
         WinfaLL1iQLxwyDLenNjtoPL1vduUT3U0GrxBsMs8dGz29VxkzZiVcvsMOYJ6g0xr1kn
         ZjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787289107; x=1787893907;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q7qYNBjYJTarZ0aCh0RmYHP1Sy0FJpXklQmt60ZqlDw=;
        b=N5nzfUo5VJxW/G69IPF6HM9UX3I9bAXNb9H3b7AqyXQdtu6zdJZYefUSy4+KO08OHs
         GPeeC/qUZKOpV+lJE2A1ZKOGeMVd3IqWe6dnRS1XZCLuVKAW+mwq+riU7UPieImbLr4z
         +22VF0MW6MTTViD9USuB3+fD5kpMowusZLdYaiYCQNOYjPggsotFLgYTxKrdOFmHT+4h
         ZvSx38rl5QKI7oT8fs1lqnlIUTZCD7xxVDmeXk83MOElTEV48Qe4w/1MLvnxtmMnk/oi
         9YNqOSG3+ny/z0RRIu4XiDfzRErH8wgrPeWbcvd9STgDNmucnDbCSZGKX/w2YsN9nL/S
         jCGg==
X-Forwarded-Encrypted: i=1; AHgh+RqnBqGE5aVZhu1y/aqJKaDp3Z3mCN70wJOx7+Yn5IPUnYbcrr4a8URVvAcHM3KxGzepbPOjhctrofzo8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNELItSp+Hy7/NJxCMT9OzSeC2ISyfFTGOm53QSqLJn7Ad2r4C
	XxZ+oCiJP1PxFOtfmPCpjSx3NvQmid9kLskqG8JPkb2ocROzjkOI/oyK
X-Gm-Gg: AR+sD11KQLhoSAtbBtuC+j2u1337DCquFkcPAiCvZ69kHUHKdWir4xgN7hG3FkIQ/cu
	5E0CdDSfUrA3XqCLiMgWdbMX4lAYHu9YrCAbmPa2wbZXndS32/tahkRceTI578lkxWkzogJrAp/
	p3Qr1Nsz1N3dv2u7PNM8h55ivsm/gs+WFp/aQPzJDZbF1qdRamZsQPxbstAmA7rvYkXUFn/83cI
	hAh0wvrBPAp9dmAfVZoG0HZL2ZUqGy9w2kKfA+gNzdtgi1m/Sz/bFeHA648I4RRewidxtrDFpY0
	iW8hqn2UTZG+eB3J0XO5eYaV0vYaqNZThMW7bZEIDDsjpb/0OyvhqeLs50SZr72PKCoM991T4zj
	L36PlQaxzup6HgQC2XTRDjvi00sPU5XyXsbyXlIQqMnKmcvrYpvXdnz2FaLnQTx8mf+JZkWKK4O
	C25pPXnw4oJHgfx/fkVRykdnfURNeI2W9aWOiddwqucLkyf0fRDyrxty0aWRvCtawAUcV7jC2df
	A==
X-Received: by 2002:a05:6a20:3d82:b0:3c3:89cf:f3a with SMTP id adf61e73a8af0-3cd2fd7c560mr5992089637.5.1787289107327;
        Thu, 20 Aug 2026 22:11:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf175399sm39220834eec.26.2026.08.20.22.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:11:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 20 Aug 2026 22:11:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jared Kangas <jkangas@redhat.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Lothar Felten <lothar.felten@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 1/4] hwmon: (ina2xx) Acquire hwmon_lock in
 shunt_resistor_show()
Message-ID: <acdfec4c-373b-4289-aa02-514765bb9c47@roeck-us.net>
References: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com>
 <20260820-upstream-ina2xx-in0-curr1-alarms-v2-1-fdce35abc41e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-1-fdce35abc41e@redhat.com>

On Thu, Aug 20, 2026 at 06:09:21AM -0700, Jared Kangas wrote:
> shunt_resistor_store() currently acquires hwmon_lock to set
> data->rshunt, but the corresponding access in shunt_resistor_show() is
> unprotected. Acquire the lock in shunt_resistor_show() as well to ensure
> proper synchronization.
> 
> Fixes: 3ad867001c91 ("hwmon: (ina2xx) fix sysfs shunt resistor read access")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260729162836.89BDF1F00A3A@smtp.kernel.org/
> Signed-off-by: Jared Kangas <jkangas@redhat.com>

Applied.

Thanks,
Guenter
