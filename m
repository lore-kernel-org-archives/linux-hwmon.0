Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81FC3C3C05
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 17:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557361; cv=none; b=oe6NxOmsxK9yc6zp0l3z7Sg+7GhNYMELg8ymRM447dTaKmVdx+RRj3HqkoiFDTJIh3rfbRqXrJzDN3kAvX4n1BfUz1/GGLugKjC9aSxxsLyTEyz75bm09oEPL9odyWG5wreOsOZ/KxtHGQgBndnIfA1kHUqn9XtadXEDaJQNErc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557361; c=relaxed/simple;
	bh=c9sAb0xHLBh6N0aOPyj+zMqFuqKW7h4L7dRFz9K73uI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5PeYzOC44m/8yI+C/YppnMqV60vQ7Hdt+qg3WFo9WGZLlth49sjEb22FOzllnuOjeTgUg6CcAheqlKbaY8VPk189c0f7KKPguSCPXWsmFrXQMNFB/FpZSy4lOknNJOxmyPwk1SDO6B0V5aHbmmqgqC00eROkAmVExv09wo1zPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbdT8ck9; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbdT8ck9"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-827307b12dfso3177496b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Mar 2026 09:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772557360; x=1773162160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eYkG6kBom6xkGiVWltyG7jkGst9QV8WXBklk6Zic4FM=;
        b=LbdT8ck9aBUrZ9jwBemE9oz0LYExrwiHlI14XKmagbO5eoJxgxYlts3CfXKPwafWp1
         Oy60oFeC20js5/NdeAlTa+uiod/HJtCjFMbPUtoxruFf/0cVlj11S+ci3BOfvu/wz6aW
         K63I1Ho3QmDnYpJtIOJSYtSZVIEfIphMsoX2VbQBYqMlvws2T3K9NuGQNxntooT2OTjh
         qsi7OIGzRpsE52iK1zF30/PhsFz+NjgqiWR16BhsZ/qn/bayf5Jn/ItWYem2Qnct114/
         TAMnCjfZEpadM0/i1ds/RqwIc8/oXNnschZ+gTUKHIE3iP6ZMnFVVNZIk4pETZLEz4PF
         X6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772557360; x=1773162160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eYkG6kBom6xkGiVWltyG7jkGst9QV8WXBklk6Zic4FM=;
        b=xNU5FzfAxvlDmNx/aVWwfmvzupEkVbG2pY+J+xcJ76RW4IHSupeuUwqb43HWn2twGY
         ccYoE7J+iGRkYhjHcbU2H3BKcTgimAzjiTiOmfXJB0dMv/iF4Nl8Ih4YjmdXvkXXahrY
         p808wRo6oWq4yjoNJ9WfJ/DIDIqXoEZ5k//1SoET59dtTQbOdpAb9Y31BXiEX/LB4Nr0
         emWzf8APH7P/KT/dN0h1lrNsaIdnNshpVwtZSVDUPgm/OE4GkyjEG1s+ynLTTDahh7Xi
         qqNtEh3g1nU5pzPWflXT8+kMQFGe7CXR4fNHA6NBxMgIlxGzKcoZ6Wz1KoqP+/SwfMZi
         ES9w==
X-Gm-Message-State: AOJu0YyCAMGf+hr52hqAJT2Fo5jL0T/PH0/vW7De2o6BwAlRwOC5JMdg
	g3Dx1/W3lsaFTa0LUSi05eAoissdQnVRzB30iQMogADUiogAQeV7Db5fhQv2dL9o
X-Gm-Gg: ATEYQzxB81ApRfcXwR9xX76LZRgN83FuhU5fTXhpCZ6p+Q9rImV6XYBPiON7msy2gYL
	/xdL231j2j/RyHbviCvyxEcunTAgtjnLF8nccYXEafkYL+qqwjnnkeRAK7l276jyUt1YZ52FMrQ
	8iyRiQ6q2ocwfSy87rvNB3Il7JxhyypKZR5nrGctOzObfPZAOxQxP7EW9gm7wrUTPn1Wo0qW/g0
	/qFs8LGb+dG2SSnNzqJnNUs7kI3ECPJ8QkLSPixq32LudbtwTjOo166Y5vhJJHImMhJPXycaSw4
	8eAfCxy1/1Y/T8sS4ENh3CNVjkmTIFbXAXulsYWHOtuQkECCBKhIZtgaJ43YgZtIZlbd8a1KqvS
	7YzyzC6Rcfq1nxHjOaLSLkZSrNfkY8KODvCO6/t1AuqPmQ028KRMpfVN5ifQdWOt/RxgDbjQa0X
	ixR/9np2ntnLSFh+1XaCN03yQyP6F/KcDW3ugC
X-Received: by 2002:a05:6a21:3cca:b0:35d:cc9a:8bc1 with SMTP id adf61e73a8af0-39814456fd1mr2347413637.27.1772557359838;
        Tue, 03 Mar 2026 09:02:39 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa848471sm14541102a12.30.2026.03.03.09.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 09:02:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 3 Mar 2026 09:02:38 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jonas Rebmann <jre@pengutronix.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (ina2xx) Shift INA234 shunt and current
 registers
Message-ID: <245e095d-d357-4fb7-b202-4b63e5cfbee6@roeck-us.net>
References: <20260303-ina234-shift-v1-0-318c33ac4480@pengutronix.de>
 <20260303-ina234-shift-v1-2-318c33ac4480@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-ina234-shift-v1-2-318c33ac4480@pengutronix.de>

On Tue, Mar 03, 2026 at 12:07:02PM +0100, Jonas Rebmann wrote:
> The INA219 has the lowest three bits of the bus voltage register
> zero-reserved, the bus_voltage_shift ina2xx_config field was introduced
> to accommodate for that.
> 
> The INA234 has four bits of the bus voltage, of the shunt voltage, and
> of the current registers zero-reserved but the latter two were
> implemented by choosing a 16x higher shunt_div instead of a separate
> field specifying a bit shift.
> 
> This is possible because shunt voltage and current are divided by
> shunt_div, hence a 16x higher shunt_div results in a 16x smaller LSB for
> both the shunt voltage and the current register, perfectly accounting
> for the missing bit shift.
> 
> For consistency and correctness, account for the reserved bits via
> shunt_voltage_shift and current_shift configuration fields as already
> done for voltage registers and use the conversion constants given in the
> INA234 datasheet.
> 
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>

Applied.

Thanks,
Guenter
