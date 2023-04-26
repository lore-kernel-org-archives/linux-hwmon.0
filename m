Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB06C7618E
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 Apr 2023 13:16:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241123AbjDZNQm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 Apr 2023 09:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241125AbjDZNQj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Apr 2023 09:16:39 -0400
Received: from s.wrqvtbkv.outbound-mail.sendgrid.net (s.wrqvtbkv.outbound-mail.sendgrid.net [149.72.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCE896A7C
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Apr 2023 06:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equiv.tech;
        h=from:subject:references:mime-version:content-type:in-reply-to:to:cc:
        content-transfer-encoding:cc:content-type:from:subject:to;
        s=org; bh=upFXodALKrU2C35uvFUHDBef/6fRHeeNt5N2llJEt28=;
        b=H2UWLW0O0S0RxTNJTGXtBT3xGYyhl9FVqg7GytF1elpQEtGPqTsF4nssVUzAfRm8g3Qj
        SSTKvtt3FXy25TKOmNp0R7ZIX2QnwUEDu92Z+C3DiILQz2wT1cYCCz9ZJrDpJkniGO9Jpz
        44ii5dXxPwBcJhigZDOpc939SWk1c2lnI=
Received: by filterdrecv-5848969764-qvkl2 with SMTP id filterdrecv-5848969764-qvkl2-1-64492431-B
        2023-04-26 13:16:33.25960134 +0000 UTC m=+86152.062976456
Received: from localhost (unknown)
        by geopod-ismtpd-5 (SG) with ESMTP
        id l-MnmYBJTKSP4U3vij4OJQ
        Wed, 26 Apr 2023 13:16:32.661 +0000 (UTC)
Date:   Wed, 26 Apr 2023 13:16:33 +0000 (UTC)
From:   James Seo <james@equiv.tech>
Subject: Re: [PATCH v3] hwmon: add HP WMI Sensors driver
Message-ID: <ZEkkLggFLCGlvq8f@equiv.tech>
References: <20230424100459.41672-1-james@equiv.tech>
 <cd81a7d6-4b81-f074-1f28-6d1b5300b937@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd81a7d6-4b81-f074-1f28-6d1b5300b937@gmx.de>
X-SG-EID: =?us-ascii?Q?1X41iaRO4wVP+tFXGLuxpQ0yxxMDhGIesR5UcsYKVengQKgidLJSXwOMZlPQwP?=
 =?us-ascii?Q?WsZT4G1WfSM7dXQDS8OSj29MqCP32Zp7ewqlNgB?=
 =?us-ascii?Q?NTBc4+8SKYmlTHqXA=2F9uI+5WebNTKIqBra1Dq8B?=
 =?us-ascii?Q?TbvDUa4m0f8vdT+y3J5nrkoK0ifFBnXwUMOWqWF?=
 =?us-ascii?Q?SvsruuZYzN+NDguYhbx+Qb6u+sSjptq1a7kUyOl?=
 =?us-ascii?Q?7oMCfAX09IPBuKX98SBTvduRt+32ouIf52I+Be?=
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     James Seo <james@equiv.tech>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Entity-ID: Y+qgTyM7KJvXcwsg19bS4g==
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Apr 24, 2023 at 11:13:36PM +0200, Armin Wolf wrote:
> Am 24.04.23 um 12:05 schrieb James Seo:
> 
>> +	for (i = 0; i < HP_WMI_MAX_INSTANCES; i++, pevents++) {
> 
> Hi,
> 
> the WMI driver core already knows how many instances of a given WMI object are available.
> Unfortunately, this information is currently unavailable to drivers. Would it be convenient
> for you to access this information? I could try to implement such a function if needed.
> 
>> +	for (i = 0; i < HP_WMI_MAX_INSTANCES; i++, info++) {
> 
> Same as above.
> 

Hello,

Having the WMI object instance count wouldn't make much difference to
me for now. The driver has to iterate through all instances during
init anyway. If I were forced to accommodate 50+ sensors, I'd rewrite
some things and I think I'd want such a function then, but I picked
the current arbitrary limit of 32 because even that seems unlikely.

So, maybe don't worry about it unless you want to. Or am I missing
something?

>> +	err = wmi_install_notify_handler(HP_WMI_EVENT_GUID,
>> +					 hp_wmi_notify, state);
> 
> As a side note: the GUID-based interface for accessing WMI devices is deprecated.
> It has known problems handling WMI devices sharing GUIDs and/or notification IDs. However,
> the modern bus-based WMI interface (currently) does not support such aggregate devices well,
> so i think using wmi_install_notify_handler() is still the best thing you can currently do.
> 

Interesting. Of course I had no idea. Though, for some strange
reason, it does look like some documentation to that effect has
emerged on the topic since the last time I checked ;)

>> +	if (err) {
>> +		dev_info(dev, "Failed to subscribe to WMI event\n");
>> +		return false;
>> +	}
>> +
>> +	err = devm_add_action(dev, hp_wmi_devm_notify_remove, NULL);
>> +	if (err) {
>> +		wmi_remove_notify_handler(HP_WMI_EVENT_GUID);
>> +		return false;
>> +	}
> 
> Maybe use devm_add_action_or_reset() here?

Will do.

Thanks for reviewing/writing.

James
