Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCF9C433FE
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Nov 2022 23:22:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbiKNXWy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 14 Nov 2022 18:22:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237810AbiKNXVa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 14 Nov 2022 18:21:30 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E60AD18E2C
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Nov 2022 15:21:29 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id k5so11726339pjo.5
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Nov 2022 15:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buVyKr/CtZ3WgOWZP4/KFObXn+G1CkWZw8PMnu7eZHA=;
        b=FY2gSHeZwPJq/ileMe9cEJrYwpiuNSOZgyucVxxlzGys0+WzD2BnNkPN68Sp2n+bNq
         aVtp4KGCJ1r7+yDQVmZtjgyj4SHS/ZcxT7WEREcJL42mUSxb4pIznibOUtVwJF93Tx7c
         yoJCbT3dOiYTMrcJUNtP0jkSa8WZeFwovpNm3RzV54jsCxYevk8xohsVyp92fAUnyaqJ
         k/XwyJfPBMC8DcJOy1F0tnoSxtdCtNqppQju9KBNpop7kOkV1URPrR83qlgyKMnwzWzp
         T0Sx44GHCNe4ebcLI4VS3dgBX2AGmSodpbNs1wfwDqdK8LpoXHsiqb4de7AXolImmbvb
         prdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=buVyKr/CtZ3WgOWZP4/KFObXn+G1CkWZw8PMnu7eZHA=;
        b=LONhQUW867GFuse+zBUfFGbcNIgPMHfGnRTqJhSKpKCbo2YKh88LFsNbllBeianB5O
         FBrkQKtX3rOdnGI9z2I+QMaO9O2R+XNhev5wz/MEQym9ewjKMTBRdyPasv+tqQLb8y2X
         hEZCMomB+mrg4q57uVNqZr7F09GVlaMFAs7EjOPy7LitomlR1qQh7uKrmzTOhTDKtr+p
         m3h2P3F02ARVKxk4bZWBXY4s1kbkN0z6XPtAoQbLr1OdVf5q7PkKuwEI3YFzj6tgS8dG
         25LCsxt0YFG7p7tP7uCpK/kWaPiJWhB6XsLYgXo/BTWzhcyNfZ8Km8kPiGLJ0ofTJulN
         JTMQ==
X-Gm-Message-State: ANoB5plK/Yt7EfgdCmof4vse1GLbBdAFrcF3x8qt6IQHj4e+67OHYj5V
        VnYx3Q7lMA7YABaxiQcImAaD2LKQ3xY=
X-Google-Smtp-Source: AA0mqf5hJTDc9qoSTDOKUSJww7jRvDZ+R06PU1YPP8eFbM6Ax7uK/3Km/pqu55STw0D/N5XJBI4GCQ==
X-Received: by 2002:a17:90b:2691:b0:213:971d:9022 with SMTP id pl17-20020a17090b269100b00213971d9022mr15929132pjb.47.1668468089494;
        Mon, 14 Nov 2022 15:21:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902da8c00b00176dd41320dsm8129273plx.119.2022.11.14.15.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 15:21:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 14 Nov 2022 15:21:27 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Zhang Rui <rui.zhang@intel.com>
Cc:     jdelvare@suse.com, fenghua.yu@intel.com,
        linux-hwmon@vger.kernel.org, srinivas.pandruvada@linux.intel.com
Subject: Re: [PATCH V2 1/3] hwmon (coretemp): rearrange tjmax handing code
Message-ID: <20221114232127.GA2289924@roeck-us.net>
References: <20221113153145.32696-1-rui.zhang@intel.com>
 <20221113153145.32696-2-rui.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221113153145.32696-2-rui.zhang@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Nov 13, 2022 at 11:31:43PM +0800, Zhang Rui wrote:
> Rearrange the tjmax handling code so that it can be used directly in
> the sysfs attribute callbacks without forward declarations.
> 
> No functional change in this patch.
> 
> Signed-off-by: Zhang Rui <rui.zhang@intel.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/coretemp.c | 156 +++++++++++++++++++--------------------
>  1 file changed, 78 insertions(+), 78 deletions(-)
> 
> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> index ec35ada68455..50b640bfa504 100644
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c
> @@ -93,84 +93,6 @@ struct platform_data {
>  	struct device_attribute name_attr;
>  };
>  
> -/* Keep track of how many zone pointers we allocated in init() */
> -static int max_zones __read_mostly;
> -/* Array of zone pointers. Serialized by cpu hotplug lock */
> -static struct platform_device **zone_devices;
> -
> -static ssize_t show_label(struct device *dev,
> -				struct device_attribute *devattr, char *buf)
> -{
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> -	struct platform_data *pdata = dev_get_drvdata(dev);
> -	struct temp_data *tdata = pdata->core_data[attr->index];
> -
> -	if (tdata->is_pkg_data)
> -		return sprintf(buf, "Package id %u\n", pdata->pkg_id);
> -
> -	return sprintf(buf, "Core %u\n", tdata->cpu_core_id);
> -}
> -
> -static ssize_t show_crit_alarm(struct device *dev,
> -				struct device_attribute *devattr, char *buf)
> -{
> -	u32 eax, edx;
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> -	struct platform_data *pdata = dev_get_drvdata(dev);
> -	struct temp_data *tdata = pdata->core_data[attr->index];
> -
> -	mutex_lock(&tdata->update_lock);
> -	rdmsr_on_cpu(tdata->cpu, tdata->status_reg, &eax, &edx);
> -	mutex_unlock(&tdata->update_lock);
> -
> -	return sprintf(buf, "%d\n", (eax >> 5) & 1);
> -}
> -
> -static ssize_t show_tjmax(struct device *dev,
> -			struct device_attribute *devattr, char *buf)
> -{
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> -	struct platform_data *pdata = dev_get_drvdata(dev);
> -
> -	return sprintf(buf, "%d\n", pdata->core_data[attr->index]->tjmax);
> -}
> -
> -static ssize_t show_ttarget(struct device *dev,
> -				struct device_attribute *devattr, char *buf)
> -{
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> -	struct platform_data *pdata = dev_get_drvdata(dev);
> -
> -	return sprintf(buf, "%d\n", pdata->core_data[attr->index]->ttarget);
> -}
> -
> -static ssize_t show_temp(struct device *dev,
> -			struct device_attribute *devattr, char *buf)
> -{
> -	u32 eax, edx;
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> -	struct platform_data *pdata = dev_get_drvdata(dev);
> -	struct temp_data *tdata = pdata->core_data[attr->index];
> -
> -	mutex_lock(&tdata->update_lock);
> -
> -	/* Check whether the time interval has elapsed */
> -	if (time_after(jiffies, tdata->last_updated + HZ)) {
> -		rdmsr_on_cpu(tdata->cpu, tdata->status_reg, &eax, &edx);
> -		/*
> -		 * Ignore the valid bit. In all observed cases the register
> -		 * value is either low or zero if the valid bit is 0.
> -		 * Return it instead of reporting an error which doesn't
> -		 * really help at all.
> -		 */
> -		tdata->temp = tdata->tjmax - ((eax >> 16) & 0x7f) * 1000;
> -		tdata->last_updated = jiffies;
> -	}
> -
> -	mutex_unlock(&tdata->update_lock);
> -	return sprintf(buf, "%d\n", tdata->temp);
> -}
> -
>  struct tjmax_pci {
>  	unsigned int device;
>  	int tjmax;
> @@ -373,6 +295,84 @@ static int get_tjmax(struct cpuinfo_x86 *c, u32 id, struct device *dev)
>  	return adjust_tjmax(c, id, dev);
>  }
>  
> +/* Keep track of how many zone pointers we allocated in init() */
> +static int max_zones __read_mostly;
> +/* Array of zone pointers. Serialized by cpu hotplug lock */
> +static struct platform_device **zone_devices;
> +
> +static ssize_t show_label(struct device *dev,
> +				struct device_attribute *devattr, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct platform_data *pdata = dev_get_drvdata(dev);
> +	struct temp_data *tdata = pdata->core_data[attr->index];
> +
> +	if (tdata->is_pkg_data)
> +		return sprintf(buf, "Package id %u\n", pdata->pkg_id);
> +
> +	return sprintf(buf, "Core %u\n", tdata->cpu_core_id);
> +}
> +
> +static ssize_t show_crit_alarm(struct device *dev,
> +				struct device_attribute *devattr, char *buf)
> +{
> +	u32 eax, edx;
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct platform_data *pdata = dev_get_drvdata(dev);
> +	struct temp_data *tdata = pdata->core_data[attr->index];
> +
> +	mutex_lock(&tdata->update_lock);
> +	rdmsr_on_cpu(tdata->cpu, tdata->status_reg, &eax, &edx);
> +	mutex_unlock(&tdata->update_lock);
> +
> +	return sprintf(buf, "%d\n", (eax >> 5) & 1);
> +}
> +
> +static ssize_t show_tjmax(struct device *dev,
> +			struct device_attribute *devattr, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct platform_data *pdata = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%d\n", pdata->core_data[attr->index]->tjmax);
> +}
> +
> +static ssize_t show_ttarget(struct device *dev,
> +				struct device_attribute *devattr, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct platform_data *pdata = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%d\n", pdata->core_data[attr->index]->ttarget);
> +}
> +
> +static ssize_t show_temp(struct device *dev,
> +			struct device_attribute *devattr, char *buf)
> +{
> +	u32 eax, edx;
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct platform_data *pdata = dev_get_drvdata(dev);
> +	struct temp_data *tdata = pdata->core_data[attr->index];
> +
> +	mutex_lock(&tdata->update_lock);
> +
> +	/* Check whether the time interval has elapsed */
> +	if (time_after(jiffies, tdata->last_updated + HZ)) {
> +		rdmsr_on_cpu(tdata->cpu, tdata->status_reg, &eax, &edx);
> +		/*
> +		 * Ignore the valid bit. In all observed cases the register
> +		 * value is either low or zero if the valid bit is 0.
> +		 * Return it instead of reporting an error which doesn't
> +		 * really help at all.
> +		 */
> +		tdata->temp = tdata->tjmax - ((eax >> 16) & 0x7f) * 1000;
> +		tdata->last_updated = jiffies;
> +	}
> +
> +	mutex_unlock(&tdata->update_lock);
> +	return sprintf(buf, "%d\n", tdata->temp);
> +}
> +
>  static int create_core_attrs(struct temp_data *tdata, struct device *dev,
>  			     int attr_no)
>  {
