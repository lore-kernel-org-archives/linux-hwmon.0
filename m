Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:32798 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753110AbcDHLjI (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Fri, 8 Apr 2016 07:39:08 -0400
Received: by mail-ob0-f169.google.com with SMTP id tz8so65446632obc.0
        for <linux-hwmon@vger.kernel.org>; Fri, 08 Apr 2016 04:39:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <56FEDB62.1010308@opensource.altera.com>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
	<1459278791-3646-5-git-send-email-tthayer@opensource.altera.com>
	<CACRpkda8VTDGVsRqbCs6ESeokA3t_p2X91FUNiqA7YM=F-JXBQ@mail.gmail.com>
	<56FEDB62.1010308@opensource.altera.com>
Date: Fri, 8 Apr 2016 13:39:06 +0200
Message-ID: <CACRpkdZu6ODbDaf1QCn8URSoJp=h3qDt2tzxxhpQ2oVO8Mb=QQ@mail.gmail.com>
Subject: Re: [RFC 4/8] gpio: altera-a10sr: Add A10 System Resource Chip GPIO support.
From: Linus Walleij <linus.walleij@linaro.org>
To: tthayer@opensource.altera.com
Cc: Lee Jones <lee.jones@linaro.org>,
	Alexandre Courbot <gnurou@gmail.com>, jdelvare@suse.com,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>, pawell.moll@arm.com,
	Mark Rutland <mark.rutland@arm.com>,
	"ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	linux-hwmon@vger.kernel.org,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Apr 1, 2016 at 10:34 PM, Thor Thayer
<tthayer@opensource.altera.com> wrote:
> On 04/01/2016 07:17 AM, Linus Walleij wrote:

>>> +struct altr_a10sr_gpio {
>>> +       struct altr_a10sr *a10sc;
>>> +       struct gpio_chip gp;
>>> +};
>>
>> Add some kerneldoc.
>
> OK. To clarify, is this comment referring to the bindings document or
> something different?

Document the data structure.
Documentation/kernel-doc-nano-HOWTO.txt

>> Please check:
>> - If there is really no direction setting anywhere
>> - For example if some lines are hardwired as input and
>>    some lines are hardwired as output
>> - If that is not the case, verify that all lines are really
>>    open drain, they should be if all are both input and
>>    output at the same time.
>>
>
> I see your point. I'll investigate how to do this properly for your 2nd
> check above. Registers are hard-wired as input or output so I'll need to
> handle this properly and is why I didn't implement the .set_direction
> callback. Thanks for the explanation.
>
> In my case, there are 12 valid GPIOs out of the 16 bits (the first 4 bits
> are unused). Bits 4-7 are output and bits 8-15 are inputs. I was using the
> IN_VALID range for the inputs and the OUT_VALID range for the outputs.

It sounds like should implement direction_[input|output]() callbacks
and just return 0 if the user is asking for the hardwired direction and return
error if it tries to set an input-only to output and vice versa.

Yours,
Linus Walleij
