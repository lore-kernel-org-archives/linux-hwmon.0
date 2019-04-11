Return-Path: <SRS0=Is7H=SN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD617C10F13
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 04:24:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E925217F4
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 04:24:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlduIEyE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbfDKEYg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Apr 2019 00:24:36 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43114 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbfDKEYg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Apr 2019 00:24:36 -0400
Received: by mail-pl1-f194.google.com with SMTP id n8so2708113plp.10
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Apr 2019 21:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tvfYGYfJa4mvFGH8/xcgNewk5qjYK2aq+YveUzmVun4=;
        b=BlduIEyEEl7VgvF6bI1uFIUqyDFsePaqnEpyeVjHftb6TAuhG8NL8NVWZGmmzRS5ZQ
         /LVvy8Dbk9dWzu84Ba9HuMOPLhoZFWykkAAK5FlpmyAn3u37FqTZuYdnu2Xm49izJIla
         3iSY281hLgRRIXunusEBqExMGj3x39/5YkhznTaMbh90hRWtfjXN+qHNMbys8GZKyr8k
         5oFaoh8VNLd9Xg+0ay7FJ7TLJ7A/uvQmFoYeRUwicDeasV4n/CL/gBH5hbcTHO3W9xfY
         QoNjdrAnJK2kXdaiQA09bxF463M7iayfZE6A2b0Q9pEsPiBq5U/9agQmGDvILtGz/KLE
         sDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tvfYGYfJa4mvFGH8/xcgNewk5qjYK2aq+YveUzmVun4=;
        b=HfzZl9JHN3d565qz1ShdQRw1cEyb7VbSUrZSaJzuEPyL/JTpmqoG7hKiPKcfOWE5t0
         3hEo8woMZRweISt5u0lQXlyr09Ngp6jCd9CxeewMF7EddutZ/nQ2dRoexnfiWn8y7Bvy
         lU7FlCPnsE2zTHFUDo1rlgve9mnLxyy6S7u+XaAHW6i3lu46+myrSHfrAJ1W4EZ2UrXk
         p2jY++YHLVxpOSDEqYUwH0YylPoPbcyeaABSrVerAMQtOR2jLdVxlJrHC+kT0q0NCc9t
         KgInJahgFYfgN/quOy41p4wh2t5pmj++XypxZ2dkUH8xk07O0WEtbDBHWEvmmWaSCK8u
         lcuQ==
X-Gm-Message-State: APjAAAXu54xPRknx6lRCPDxnckjzryOEhK2zhLb8UZgIMZ1m5J3Fscy/
        EdS/Knv7KapBVaQXtmSh3wM=
X-Google-Smtp-Source: APXvYqxCtCoFT930xv5EQz8z8Fu0ELFqQXGOTWPuCCAQs1uGian537O+9oy9s89n3DAl5mng2Fi4Xw==
X-Received: by 2002:a17:902:b58e:: with SMTP id a14mr18832932pls.44.1554956674803;
        Wed, 10 Apr 2019 21:24:34 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id j12sm44819816pgg.79.2019.04.10.21.24.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Apr 2019 21:24:34 -0700 (PDT)
Date:   Wed, 10 Apr 2019 21:24:29 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>, Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH 2/3] lm25066: export sysfs attribute for SAMPLES_FOR_AVG
Message-ID: <20190411042429.GA19533@Asurada-Nvidia.nvidia.com>
References: <cover.1554934898.git.krzysztof.adamski@nokia.com>
 <e231af1feac9cbe8b72923a13587035220b76ad8.1554934898.git.krzysztof.adamski@nokia.com>
 <13669c15-3373-da20-6d68-50842d91be18@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13669c15-3373-da20-6d68-50842d91be18@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Apr 10, 2019 at 05:55:19PM -0700, Guenter Roeck wrote:

> > +static ssize_t samples_for_avg_show(struct device *dev,
> > +				    struct device_attribute *attr, char *buf)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev->parent);
> > +	int ret;
> > +
> > +	ret = pmbus_read_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return sprintf(buf, "%d\n", 1 << ret);
> > +}
> > +
> > +static ssize_t samples_for_avg_store(struct device *dev,
> > +				     struct device_attribute *attr,
> > +				     const char *buf, size_t count)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev->parent);
> > +	int ret, val;
> > +
> > +	ret = kstrtoint(buf, 0, &val);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = pmbus_write_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG,
> > +				    ilog2(val));
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return count;
> > +}
> > +
> > +static DEVICE_ATTR_RW(samples_for_avg);
> > +
> > +static struct attribute *lm25056_attrs[] = {
> > +	&dev_attr_samples_for_avg.attr,
> > +	NULL,
> > +};
> > +ATTRIBUTE_GROUPS(lm25056); // should we set a name of this group to put all
> > +			   // those attributes in subdirectory? Like "custom" ?
> > +
> We don't add subdirectories for other chips, and we won't start it here.
> 
> I don't mind the attribute itself, but I do mind its name. We'll have
> to find something more generic, such as 'num_samples' or just 'samples'.
> I am open to suggestions. We'll also have to decide if the attribute(s)
> should be limited to one per chip, or if there can be multiple attributes.
> For example, MAX34462 has separate values for iout_samples and adc_average.
> Do we want samples, {curr,in,power,...}_samples, or both ? Or even
> currX_samples ?

For my use case -- TI's INA chips, there is only one "samples"
configuration being used for all currX_inputs and inX_inputs.
So having a "samples" node would certainly fit better than an
in0_samples. So I vote for having both.

Thank you
Nicolin
