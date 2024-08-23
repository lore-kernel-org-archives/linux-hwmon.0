Received: from so254-32.mailgun.net (so254-32.mailgun.net [198.61.254.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E295C7346D
	for <linux-hwmon@vger.kernel.org>; Fri, 23 Aug 2024 05:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.61.254.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724392647; cv=none; b=J9ZfguTRe01tCiPVlbP9DuF5T2J2uuIbI+L0PSlgnrmpgIn6LT6hjUF/AhIY0d3CUllIy4BdqScd6pblsMq5HKBtWmbxwL/M2lLZeIqtnmK1zwg93gW8nqoyCm7FmP3tD2x+Jmp+yWlKwhWWZsqBiNezx1N1wwvfQ7mvL3K4v20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724392647; c=relaxed/simple;
	bh=BZJwmLYYUt0OprlBbHQaq4XEuX1Yu/mMxNf58jHFWDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGVXCpapBrxdxEgGxLF6cwZ5CePR+hFBroC67WbniD/MszkvHfVsx2mUAFlpHMuQyzVAS9rTM+VvrkSfjZxc608c0W/b3+FUBF8Gl69rmpZyRaSWigE8e/WULPM8OnCVQ6+BZXToErC2JyxdY98Z3za1vVWuQe3Yg7Jdh0UFo/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=equiv.tech; spf=pass smtp.mailfrom=equiv.tech; dkim=pass (2048-bit key) header.d=equiv.tech header.i=@equiv.tech header.b=m+osVJQg; arc=none smtp.client-ip=198.61.254.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=equiv.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=equiv.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=equiv.tech header.i=@equiv.tech header.b="m+osVJQg"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt; s=mx; t=1724392644; x=1724399844;
 h=In-Reply-To: Content-Type: MIME-Version: References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date: Sender: Sender;
 bh=u+VhrC22RZGtxJLHBK+uwUVXwszI5ugWNatDD2VcTAQ=;
 b=m+osVJQgeWYiDEOsu6CcMe/CMkplzZl40QPX6hThpjmfYeFJrB6P67F9D+X5BZCoveoUkNFPpIYBtK5epbVgVAE7S1Flz5++bqxnaWIwbs20nShgzA+ZnlhSKlufIR7K/QXIfe7mwBz3yWcDmU0snEWgwnGmsoUU2bJ+QYdkkbq9u6IkE9AFbiGuV6Jum9A5KkVanrVoYXBHM6R4OQLNHlwKdeyzl1QNt+aeDBCmlgN4zIHv4zBtKhUFfslhOv7bYSWZenBBbTUdp9lBtMW2Q/jmE5KpTAOUedwbGSNePpTffVqa7f4MNfJ55qlwJc6wyx4IOCs/J2LSdZiKCKAlXw==
X-Mailgun-Sending-Ip: 198.61.254.32
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by f97076a2080f with SMTP id
 66c824c4c8b26bc9edd95b28 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Aug 2024 05:57:24 GMT
Sender: james@equiv.tech
Date: Thu, 22 Aug 2024 22:57:23 -0700
From: James Seo <james@equiv.tech>
To: Armin Wolf <W_Armin@gmx.de>
Cc: jlee@suse.com, corentin.chary@gmail.com, luke@ljones.dev,
	matan@svgalib.org, coproscefalo@gmail.com, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, rafael@kernel.org, lenb@kernel.org,
	platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] hwmon: (hp-wmi-sensors) Check if WMI event data
 exists
Message-ID: <Zsgkw1kHz9TJx27g@equiv.tech>
References: <20240822173810.11090-1-W_Armin@gmx.de>
 <20240822173810.11090-3-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240822173810.11090-3-W_Armin@gmx.de>

On Thu, Aug 22, 2024 at 07:38:07PM +0200, Armin Wolf wrote:
> The BIOS can choose to return no event data in response to a
> WMI event, so the ACPI object passed to the WMI notify handler
> can be NULL.
> 
> Check for such a situation and ignore the event in such a case.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/hwmon/hp-wmi-sensors.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensors.c
> index 6892518d537c..d6bdad26feb1 100644
> --- a/drivers/hwmon/hp-wmi-sensors.c
> +++ b/drivers/hwmon/hp-wmi-sensors.c
> @@ -1628,6 +1628,9 @@ static void hp_wmi_notify(union acpi_object *wobj, void *context)
>  	 * HPBIOS_BIOSEvent instance.
>  	 */
> 
> +	if (!wobj)
> +		return;
> +
>  	mutex_lock(&state->lock);
> 
>  	err = populate_event_from_wobj(dev, &event, wobj);
> --
> 2.39.2
> 

Reviewed-by: James Seo <james@equiv.tech>

That also goes for the portion of the previous patch in
this series dealing exclusively with hp-wmi-sensors.
