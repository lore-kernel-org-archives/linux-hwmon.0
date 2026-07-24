Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D2741D655;
	Fri, 24 Jul 2026 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888306; cv=none; b=p660A8kOkjH6FE5pLoeSLnoP7JRLK9tTI5yuy3QpC0fLdBP7oL3quA80kH8y9iDCoxuDSwUO6CAFFeJkqpkl8MeE7dzh6pHFOUeh+GcHLOdrWh7KyNlPYFfRSg/0mr8Pl9taxSy2Vy8l7vrW7EtBQelcaH/uTwf31QwAXwPaqgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888306; c=relaxed/simple;
	bh=lPA//hbqzJYrhAR8Hk3zbd8nOl7egPXF9z0Rp6xotCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ri4jCO5AYhSsaSOJzavuH60mbuDDX1TqydyEUjLkuTdGPzbK2m4yHXDt/P+UN5dSXd3ph5JPMzzbHorJQgkBfdL0y1CE59SydKbGi8ldKsNmWfnUjnGCC7yxNuKrJ8D/j5PAOtVMS4gK+7LnlencVgz/Hq3b8uAc0rqs4fNEMPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=E7mpIYjH; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="E7mpIYjH"
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 1AE40780372;
	Fri, 24 Jul 2026 12:18:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1784888300;
	bh=lPA//hbqzJYrhAR8Hk3zbd8nOl7egPXF9z0Rp6xotCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E7mpIYjH3NF1fJkmPep2XSQRs1Wh8UYlHvK1sNM0MZWKw/nvfnlHaeteyVNN91q+q
	 fNj5+zlf87lgEpCijSMKCCtyN7n2EfRKRyND2tphONAhC75Acxpc4+Hqz0KJHTkmkm
	 tnnBs951TzotQB5C/o/FtCo5Epp2cJhrMO9m2dGAngQ4I3/4efzcSjHHg5ZiUTO+W+
	 GE0nF/YMK/kQYd4dE69mxv8Qln0lRO7KLZO6UIvdpyDDDHexecgxP2biJcX5i9GNH8
	 I1MZ98K6urGrf2n+d3ZoXZOKA3ijX0n+1eblEo1prBtBOWv86RtwuJYQd0HK3xkx4B
	 D5z7j4F2ZwVnw==
Date: Fri, 24 Jul 2026 12:18:08 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 3/3] hwmon: pmbus: add MPQ8646 driver
Message-ID: <amM74M7myX2tJXMQ@L30177.local>
References: <20260724-mpq8646_v0-v5-0-5915b5ae9aa2@free.fr>
 <20260724-mpq8646_v0-v5-3-5915b5ae9aa2@free.fr>
 <6abbdabe-91ec-4757-a646-8b2b2d4058d3@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6abbdabe-91ec-4757-a646-8b2b2d4058d3@roeck-us.net>

Hi Guenter,

> > +	for (i = 0; i < ARRAY_SIZE(mpq8646_alarm_map); i++) {
> > +		if (newly_set & mpq8646_alarm_map[i].mask)
> > +			hwmon_notify_event(priv->hwmon_dev,
> > +					   mpq8646_alarm_map[i].type,
> > +					   mpq8646_alarm_map[i].attr,
> > +					   mpq8646_alarm_map[i].channel);
> 
> This is wrong. This will require a new exported notification function
> in pmbus code.

OK, next, I'll try to factor the body of pmbus_fault_handler() into
an exported helper, something like pmbus_check_and_notify_faults(client).

It should help to revisit it.

Best regards,
  Vincent
