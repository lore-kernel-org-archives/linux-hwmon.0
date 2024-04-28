Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43BE40854
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 18:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714327678; cv=none; b=j5kHf0s+DKOqXrB15U+D/oXdJcFCOzs+T/oQ5HWi5Xrn+dcI6jQ/tumqC5tw7quNEU29hgdm7jdN8UlnoUixvy6JRz1b0GkHSxZaWrmzH31DZ9Dmq9cKcF5VyQ4tVB3bUMMJYFJ3vzKe2LB21458XzqbkpYsZWJ+OTJJnqzOsU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714327678; c=relaxed/simple;
	bh=V5OrHTA2pObtJRM+omQUb1mEa8E1Exqyo5UOPI0669M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PEDBzKeV0XMVB/XdZxtOKffaeQln3rl1SAzDp48fs46M45RkpJMj5GdjCCkgl5MGEWbcGsdyoiv1795n/2N7t5WCiO23TLQbnWQz5QFAlm1S8HDGekTosJgH+QsRoT9j6L62WAGcpVvzmo8Ry4Y6NFKw8anlIvvtujd6B88ZN6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jrY6d06O; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrY6d06O"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-6082fd3e96eso2639441a12.1
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 11:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714327676; x=1714932476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aM7RT2qY5etVj0wT1IkyN8/DbwdHoTsLhPoGcIIMDDQ=;
        b=jrY6d06O4h60FPabdBR8CraEZ6VN1QEq4W9Z5SZwL0qS+DdxdGhd7YSbOS4CHHKUMJ
         xwM1nr627NHvNLdS4xc7xBIn2zIHF3KcD0hXzEU8KiG7Wn4VaSuxIUIOlFT8KRR/fs6c
         rtkYUrDvNLGYF0jcFG4BQhaqnv7uq0XMp24SXRjcvAQgjZeHk8/F1jn8C7rv+qJUniyd
         yml09yU3ihS8gv9KQ5bU7rtTitBlliXBPJKURwgZ0vUG3t/wHQzZzisQFApFmCuM46w5
         fP2xHZo/+puRm1XK0eJzaoPdTJ4khVNfZ6PQW6zADwzATowj9btAkMLT2fFhZl/ma2WS
         OAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714327676; x=1714932476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aM7RT2qY5etVj0wT1IkyN8/DbwdHoTsLhPoGcIIMDDQ=;
        b=Lb9x1RNKjnWhJ3TEOQFYKm0inxeJ0U1sLHynqi86wO8rEEa/7k3gHtFrH8C6pNof49
         E9cj+pyATuiDPy2c+jvHQnLX6qlRcq9ysG0gTo7cTAOwvGEGb0jRwWWNvzXL0hsIjDur
         cq0dSkyZnNcd9n/ph9VKTIISEI+YHQ3swefmOPLQRw/cKvLwsxasgOYtDdzsQbFbd/42
         zxGjJeEkFlc0i5HDHjpxlzZO9Q5xDo5RYeiAiauoHFi7t5X+Gj3MVobhdtrqYwMHvfma
         7SLoHoKZOmJZ5tCwrvjs502vt7tDLaBTroSoNU2o+OknaqH6+rjx9ZMgD5On+XQInItx
         9H2w==
X-Forwarded-Encrypted: i=1; AJvYcCXF6WWei0vb1pB5Gqo5t5CaihFVQez7OZXcC4sVsTRHfUNCHbbVfFzQPBDBJCaFOHLHdmKvGAN9ZNfvKFrgLoy8NHLB1C0jyC1e2Gs=
X-Gm-Message-State: AOJu0Yw7wifjCKiw+ifAjoUk1Nt0KBJtVosc2IhuBOIzpUK1xN+3hOl8
	YsBOUOqerLeM1tav6SC3pWGbIrdkJYtQ2jQnRjXjlira1HgqhzWp
X-Google-Smtp-Source: AGHT+IE68ppDKhtlZtES1+eSU0cDmPr+7d+tKMt6uX9p1AHnfkxZt4hBCqaF+feKLOkpQjIuic2npw==
X-Received: by 2002:a05:6a21:168c:b0:1ae:431b:c53b with SMTP id np12-20020a056a21168c00b001ae431bc53bmr7467026pzb.35.1714327676012;
        Sun, 28 Apr 2024 11:07:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id fq5-20020a056a0060c500b006ed2709ada6sm17850825pfb.65.2024.04.28.11.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 11:07:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 28 Apr 2024 11:07:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Lars Petter Mostad <larspm@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	Lars Petter Mostad <lars.petter.mostad@appear.net>
Subject: Re: [PATCH] hwmon: (emc1403) Decode fractional temperatures.
Message-ID: <558708ed-4a26-44bb-85f7-eb2f2ac943be@roeck-us.net>
References: <20240426141322.609642-1-lars.petter.mostad@appear.net>
 <56b04367-8b5a-4c73-a741-729c55daf83e@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56b04367-8b5a-4c73-a741-729c55daf83e@roeck-us.net>

On Sun, Apr 28, 2024 at 11:00:47AM -0700, Guenter Roeck wrote:
> On Fri, Apr 26, 2024 at 04:13:22PM +0200, Lars Petter Mostad wrote:
> > Decode all diode data low byte registers.
> > 
> All ?
> 
> > Signed-off-by: Lars Petter Mostad <lars.petter.mostad@appear.net>
> > ---
> >  drivers/hwmon/emc1403.c | 34 ++++++++++++++++++++++++++++++++--
> >  1 file changed, 32 insertions(+), 2 deletions(-)
> > 
> > 
> > base-commit: e723f6ca39fb54ae31f79b5af74fe8496308d4de
> > 
> > diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
> > index d370efd6f986..2b14db802f96 100644
> > --- a/drivers/hwmon/emc1403.c
> > +++ b/drivers/hwmon/emc1403.c
> > @@ -37,13 +37,43 @@ static ssize_t temp_show(struct device *dev, struct device_attribute *attr,
> >  {
> >  	struct sensor_device_attribute *sda = to_sensor_dev_attr(attr);
> >  	struct thermal_data *data = dev_get_drvdata(dev);
> > -	unsigned int val;
> > +	unsigned int val, val_lowbyte;
> 
> FWIW, this is wrong. The upper bit of the high byte is a sign bit
> on emc1438.
> 
> >  	int retval;
> > +	int idx_lowbyte;
> > +
> > +	switch (sda->index) {
> > +	case 0x00:
> > +		idx_lowbyte = 0x29;
> > +		break;
> > +	case 0x01:
> > +		idx_lowbyte = 0x10;
> > +		break;
> > +	case 0x23:
> > +	case 0x2a:
> > +	case 0x41:
> > +	case 0x43:
> > +	case 0x45:
> > +	case 0x47:
> > +		idx_lowbyte = sda->index + 1;
> > +		break;
> 
> What about the following ?
> 
> 2c -> 2e
> 2d -> 2f

Also all other limit registers, and for those the write part is missing.

Guenter
