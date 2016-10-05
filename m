Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:52683 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751154AbcJENXk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Oct 2016 09:23:40 -0400
Subject: Re: adm9240 error handling (was Re: [PATCHv1] hwmon: adm9240: handle
 temperature readings below 0)
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
References: <20161004040800.9689-1-chris.packham@alliedtelesis.co.nz>
 <20161004205359.GA29531@roeck-us.net>
 <3c7c751bd9d24856ace5866ffb94060a@svr-chch-ex1.atlnz.lc>
 <20161004220938.GA4566@roeck-us.net>
 <56fa4053f8a448a38b9f1e0dd45a0092@svr-chch-ex1.atlnz.lc>
Cc: "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Michael Wang <Michael.Wang@alliedtelesis.co.nz>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <26be7a39-780e-2659-9afd-ec82f2511845@roeck-us.net>
Date: Wed, 5 Oct 2016 06:23:37 -0700
MIME-Version: 1.0
In-Reply-To: <56fa4053f8a448a38b9f1e0dd45a0092@svr-chch-ex1.atlnz.lc>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 10/04/2016 10:00 PM, Chris Packham wrote:
> Hi Guenter,
>
> On 10/05/2016 11:10 AM, Guenter Roeck wrote:
>> On Tue, Oct 04, 2016 at 09:09:10PM +0000, Chris Packham wrote:
>>>
>>>>
>>>> Of course, all that doesn't solve the real problem in this driver, which is
>>>> that it ignores error codes from the smbus functions, but that is a different
>>>> problem.
>>>
>>> Yeah I'd noted that too. This patch is actually a port of changes we've
>>> made to a custom LM81 driver based on the original adm9240 driver which
>>> included some error handling. I'll look at bringing more of that code in
>>> for a future patch.
>>>
>> Sounds good...
>>
>
> So on this. The as-yet unpublished changes we have basically consist of
> changing adm9240_update_device() to do something like this
>
>
>                          || !data->valid) {
>
>                  for (i = 0; i < 6; i++) { /* read voltages */
> -                       data->in[i] = i2c_smbus_read_byte_data(client,
> +                       ret = i2c_smbus_read_byte_data(client,
>                                          ADM9240_REG_IN(i));
> +                       if (ret >= 0)
> +                               data->in[i] = ret;
>
> The user is still none the wiser that there was an error but at least we
> haven't just attempted to write a error code to the data. Is this the
> direction you want to head? Are there other hwmon drivers that do
> something saner?
>
> Another attempt we've made is to try to read something innocuous like
> the CONFIG register to check that the i2c bus is in a good state before
> reading the rest of the values.
>
> As you can guess these "fixes" have piled up over time and because
> they're hard to test we haven't been brave enough to remove them.
>
> Any thoughts?
>

The usual approach would be to return an error from adm9240_update_device(),
and report it to the user. Hiding the error and returning stale data doesn't
sound like a good idea.

Another option would be to drop value caching from the driver entirely,
and convert it to use regmap (so only the actually changing registers
would be read again).

Thanks,
Guenter

