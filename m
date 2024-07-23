Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C837A15252E
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 14:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721744408; cv=none; b=IAhxuNNxyLyXNeHlLe7ApCjPx3L+ko7nlsDciM2EL8n7JOoN7/VD/agHlfS1V06jMSEhFdb6IxyxgVZXFkoWpJyjMMuT4WrmOoaMq5fYY6u1ko1f0Q7x1w0nTJpWqO80N7Ze9UcOydUh+88RouoYCv/wBwpev+RvMSyvnKnio1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721744408; c=relaxed/simple;
	bh=cq+XzmZaUPiuYnIbzWdQO92IZ7vliC8UaZn0mqnLDVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyYewJFnb5EdZFiFqY77NoxBO9CZuHF8M0GY+L4/5JZl4q7+yGVCp/1YcrknPcpW8Ho2xqBtRLFRRz6AXxagcXjlJcOQfE/htW6I2GyvRAGyuTb8WeXLrV43D/diji+62DZgIKbcuanso38hs6BAnOsDVtVIInEuD5SNbBONjfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cViAYSaP; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cViAYSaP"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fc49c0aaffso39402605ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 07:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721744406; x=1722349206; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1sKTUhqOXChyRdaTFA72cXbk0I11iaju3lS6rMMtU3A=;
        b=cViAYSaPbnhP8iHjAG0+m4YlVfmgXvcMfOqpYaz5nTdik3NsTL0/YrTm/zh7AFD9XH
         BkilPP9CN+7+0OqWE/jTrgN/aq30Dp6yMFweP++QSDSjKUVLzIH5QpAbsvliJHzMTY+Q
         jGJ+HwBJC/ww41jNpsOQ8BwcCwB8HdURxOcw8rM9RA+vbzpouO3Jz1uRYXyeuy9RHoWv
         QD9i6pCErdSz+u7emR6c1n4Knp2PDlw1umGJoUXf5awwFWlp/uO8mDrG4s8GAPPFH3b6
         EmWkLi6uWFq2Oz8w6K/jnp6TWmH9gzXlO+fUQ7+/3iEf/obXfhhTQw55ORJcCr1GyiM2
         mGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721744406; x=1722349206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sKTUhqOXChyRdaTFA72cXbk0I11iaju3lS6rMMtU3A=;
        b=rVxjCe7ILv3DAcYovOHKZN+rPoirMMvgKAXtuVNqnIez8cGSBZ7tc8XHFHagKsGPA3
         MCkpLIow1GzXpi8daUXFKPN6mnSpghwsVe7OCMh9Fkr6A7JC3qR5IqpKoP6oDcqoRPIm
         dN0Y3LjRXPBnzhexhNwmx2Rd0KIpaN5b5Dbk1qSRI2hKdpXajNBsn4m5iXWXSlq+Zozw
         bkZgPjFa04OnM7/NoO5eYoTjTNAGC1NLnu6JsfgM6mtfWtCBp/71d7og3NgR1Ngr9WBe
         iOlU99FY5ro4zYr51AqqQA0XqnWEF7FGJiEWkOAy5mqzGgDDLNv4Y68Exr1h2HdcyqP5
         ZfSA==
X-Gm-Message-State: AOJu0Yxq1H8NJBbbN1y4GZjaIAj32i6h6NnLYyxLyp0GLKHFE4gvviX8
	nTQPRJP2AKrkssog8Ba3bY3ewKj27Nuf+u+QXEnfKc18zpZFDOsVD5wIyA==
X-Google-Smtp-Source: AGHT+IGj3gEirOgnsYB/yi/la9IeTf+beA1se+m3OwVieKDrynHU3gnxEa3xiGGUOlSV1mv7zoZMMA==
X-Received: by 2002:a17:902:ecc2:b0:1fb:90e1:c8c0 with SMTP id d9443c01a7336-1fd7468c870mr71671465ad.63.1721744403921;
        Tue, 23 Jul 2024 07:20:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f3181ffsm75491965ad.155.2024.07.23.07.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 07:20:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 23 Jul 2024 07:20:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 2/6] hwmon: (max6697) Drop platform data support
Message-ID: <74c7c412-6f8b-40d7-9f43-d28ae91db5e0@roeck-us.net>
References: <20240723005204.1356501-1-linux@roeck-us.net>
 <20240723005204.1356501-3-linux@roeck-us.net>
 <Zp9Bh4JgGJX3yhV6@google.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zp9Bh4JgGJX3yhV6@google.com>

On Tue, Jul 23, 2024 at 05:37:11AM +0000, Tzung-Bi Shih wrote:
> On Mon, Jul 22, 2024 at 05:52:00PM -0700, Guenter Roeck wrote:
> > +static int max6697_config_of(struct max6697_data *data, struct i2c_client *client)
> >  {
> [...]
> > -	pdata->smbus_timeout_disable =
> > -		of_property_read_bool(node, "smbus-timeout-disable");
> > -	pdata->extended_range_enable =
> > -		of_property_read_bool(node, "extended-range-enable");
> > -	pdata->beta_compensation =
> > -		of_property_read_bool(node, "beta-compensation-enable");
> > +	confreg = 0;
> > +	if (of_property_read_bool(node, "smbus-timeout-disable") &&
> > +	    (data->chip->valid_conf & MAX6697_CONF_TIMEOUT)) {
> 
> s/data->chip/chip/.
> 
> > +	if (data->type == max6581) {
> 
> Should be `data->type != max6581`.
> 

Correct, It needs a bit more, actually. For max6581, the check needs to be

	if (of_property_read_u32(node, "resistance-cancellation", &vals[0]) &&
	    of_property_read_bool(node, "resistance-cancellation"))
		vals[0] = 0xfe;
	else
		vals[0] = 0;

because the bindings specifically permit to have a boolean
resistance-cancellation for this chip as well.

Thanks!

Guenter
