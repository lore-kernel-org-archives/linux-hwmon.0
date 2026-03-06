Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C832D131A
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Mar 2026 16:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813948; cv=none; b=Gr5Q4Gxwb45sHHNKCMie7t2GkAdByzyztQMSlMYLjdaqz0MGRqo4u5qf55Z7a/Y5II8fVVmtQyUDp3uwFAK+2Wmh/t1YSdSglzai55bRA25Y7H6cr7r9irR6zv/WdT1byIAWmYYSHs/dzJks7rQzydt4rrmc3znexormUwPYFy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813948; c=relaxed/simple;
	bh=MMIfXn3SaGBrsDGHGIj6huBLeQteVGNpJvtTZSNnsXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ag+PnsbNRhk94fOQlgEcvsdx9bHt/OR+RZKnKHM5SpU5EVmj1+jjOX+waJzBhNHdFaTxLSu0mYkFKgNh+YAv0QSK/cojVt8dIAOd8s0XzBhyohYGbTCplrbVtJLelaWW7X8wLu78jMqPEc4W84HzYTae/AYSZqJOHdOkq+JNN/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOfzWduS; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOfzWduS"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-127380532eeso3712269c88.1
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Mar 2026 08:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772813945; x=1773418745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xs8oBvrazl2gqaolpxLbRL+ma/RjTVxaRJFERhwZCjQ=;
        b=IOfzWduSkdo4JzVJQEfxqVEr/vnpD5OgVNukmdqDN1VF21dYZVjvbPZX8OxY7VhQfL
         haJJiURBoa+jX2b6c6Qdg1XUhfLlRivz2ch5v067GtQ89OS2z1ZNdedZxDEqKAq616yP
         I06spOgytvMdizB7r+zKYbWz8Xrt5YWB8m6MnV61QnpUHtO0gUcYOnrSWMovUvK5GZvk
         8iMaCzM/eeVNnnSEGlX3Bniq0F0XBqD1HhwExDCwZbaCBpAYHj4uuJCV474rmZp4VwiI
         eAjHc5JnNCJylg3ukD5+D2xRVNBXTM5UmF2DXogJhwMPjMzRUW6rg6TyOCxujUAwb7p4
         Om9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772813945; x=1773418745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xs8oBvrazl2gqaolpxLbRL+ma/RjTVxaRJFERhwZCjQ=;
        b=Q0ySJ/bL1+HKdSb2FHaQZ8ItRZGiUHp4pmdyW/bkGnZO1vEmhhv/AXK6/gZ1gvzjwv
         m/ujuLMNzYhZAwYCZf1iT7BLFvNIsVCPXYsrPf3XhZ+gKibX7tKXFfHYKHd1RH1iVFuS
         QVXRidrz6umWtdyt/ldISrC/jGqayStPMwEAipZJkM/WyLCOMet49UK+DdC4GQg5jPGg
         qvNuBTI1pNlaCUHo7LdC9+y2LNvITJcoQX6fTDYfW5R/um1Foaki8uE34OMgeqCBT+Uf
         KWOcrgQCaDK7SURyZoSgfhMKsWDVTTHRreae6w8OXZH70uIZyeAA80b0uOM1MAA3EGRm
         bRhg==
X-Forwarded-Encrypted: i=1; AJvYcCVGOstbeM2f18KK/M38fSrUnlbKeTTCcB2iuT05GdjaZYVs0kOsoDYLWo5RzzbnW0dAKw252tqUqOZw+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvL1ghp1CknCWVpMKtYNWc+MJXFRUakPv4B+t6mxwta41BC8U7
	okebJ2k8zAo8bXsffXZwRo0a53BN0D3pVwXv2zF0ClHcXJWD5ylueusq
X-Gm-Gg: ATEYQzwhmOcIlRxIpvp+hzvVRtD0urGitmdzdEsNBWIGsuHjcg6quslJnzlKMsRWFq+
	FJOXZ03yNPtKWiHieE0Cgrk5ubukjCtyvX3e96ktsmixqqcU2wh8X6cI4SR6/kjtSU7oWv0bzkF
	ghADMqIEs7OIgq4NXAVBznzlPlt2goKEgL7Skxes+AhjFRYaPyutxaboBj4RPEa4+DEsOfLbpl2
	rAxKKmTrVdFNXF/+J2IB70wyICmL8ou9q5sPHkPmXWsrth6LVFUdC0/I/UnWOFiljotFngVy5bR
	1pmBlv2jkZMAJbCl3xrKdXuU2prHKYEAweNKBmCvJseP8waGgYSqfGAuR20JtS5RHUeesolntK/
	l9cc94UUCLfB8MVFVHBnpe3OGsSb6D6BqZf1orowQTJNqhlnlZn8GFhyB4S1HxDU8ESi153egZD
	zwnjGshyhQQbwn1Q0BGw0gDNi9aO71LUuFgoP3
X-Received: by 2002:a05:7022:521:b0:128:bb7e:b5f7 with SMTP id a92af1059eb24-128c2ea7c5emr1236561c88.36.1772813945257;
        Fri, 06 Mar 2026 08:19:05 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3f43593sm1617443c88.9.2026.03.06.08.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:19:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 6 Mar 2026 08:19:02 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Davis <afd@ti.com>
Cc: Chiang Brian <chiang.brian@inventec.com>,
	Erick Karanja <karanja99erick@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/11] hwmon: (pmbus/ibm-cffps) Remove use of
 i2c_match_id()
Message-ID: <4dc0c4b5-12b4-4fdd-b247-13d8c88c8c20@roeck-us.net>
References: <20260305195642.830695-1-afd@ti.com>
 <20260305195642.830695-3-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305195642.830695-3-afd@ti.com>

On Thu, Mar 05, 2026 at 01:56:33PM -0600, Andrew Davis wrote:
> The function i2c_match_id() is used to fetch the matching ID from
> the i2c_device_id table. This is often used to then retrieve the
> matching driver_data. This can be done in one step with the helper
> i2c_get_match_data().
> 
> This helper has a couple other benefits:
>  * It doesn't need the i2c_device_id passed in so we do not need
>    to have that forward declared, allowing us to remove those or
>    move the i2c_device_id table down to its more natural spot
>    with the other module info.
>  * It also checks for device match data, which allows for OF and
>    ACPI based probing. That means we do not have to manually check
>    those first and can remove those checks.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  drivers/hwmon/pmbus/ibm-cffps.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> index d05ef7a968a96..884b17de3b623 100644
> --- a/drivers/hwmon/pmbus/ibm-cffps.c
> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> @@ -482,19 +482,9 @@ MODULE_DEVICE_TABLE(i2c, ibm_cffps_id);
>  static int ibm_cffps_probe(struct i2c_client *client)
>  {
>  	int i, rc;
> -	enum versions vs = cffps_unknown;
> +	enum versions vs = (uintptr_t)i2c_get_match_data(client);

AI feedback:

  Does this inadvertently change the fallback behavior for unmatched devices?

  In the old code, `vs` was initialized to `cffps_unknown` (which is 2). If a
  device was instantiated manually via sysfs without a matching I2C name, both
  `md` and `id` would be NULL, and `vs` remained `cffps_unknown`. This
  correctly triggered the dynamic version detection logic using
  `CFFPS_CCIN_CMD`.

  With the new code, if `i2c_get_match_data()` doesn't find a match, it returns
  `NULL`. Since `NULL` casts to `0` (`cffps1`), the driver will now default to
  `cffps1` and skip the dynamic version detection entirely.

  Additionally, because `cffps1` is `0`, `i2c_get_match_data()` cannot distinguish
  between an explicit `cffps1` match (where `.data` is `0`) and no match at
  all, since both result in returning `NULL`.

  To safely support fallback, `cffps1` could be assigned a non-zero value in
  `enum versions` (e.g., `enum versions { cffps1 = 1, ... }`).

Guenter

>  	struct dentry *debugfs;
>  	struct ibm_cffps *psu;
> -	const void *md = of_device_get_match_data(&client->dev);
> -	const struct i2c_device_id *id;
> -
> -	if (md) {
> -		vs = (uintptr_t)md;
> -	} else {
> -		id = i2c_match_id(ibm_cffps_id, client);
> -		if (id)
> -			vs = (enum versions)id->driver_data;
> -	}
>  
>  	if (vs == cffps_unknown) {
>  		u16 ccin_revision = 0;
> -- 
> 2.39.2
> 
