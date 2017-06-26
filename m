Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-yb0-f178.google.com ([209.85.213.178]:33473 "EHLO
        mail-yb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751428AbdFZNuy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Jun 2017 09:50:54 -0400
Received: by mail-yb0-f178.google.com with SMTP id 84so611919ybe.0
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jun 2017 06:50:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <6ec902f6-2eb6-f0dc-849c-a62095d0f937@roeck-us.net>
References: <20170624033946.120501-1-venture@google.com> <d2b275f1-cbb2-5266-51e0-4c50aa9b8798@roeck-us.net>
 <CACPK8XckfG5bcv=ouTt=OH3UZx8GkfY8P-mBr4VQcPYmYdoG6w@mail.gmail.com> <6ec902f6-2eb6-f0dc-849c-a62095d0f937@roeck-us.net>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 26 Jun 2017 23:20:32 +0930
Message-ID: <CACPK8Xe-rccUEGr5nWtXZU412FX+nfWC=U2m7WxC=bY8fb8T0w@mail.gmail.com>
Subject: Re: [PATCH 1/2 v3] hwmon: (aspeed-pwm-tacho) reduce fan_tach period
To: Guenter Roeck <linux@roeck-us.net>
Cc: Patrick Venture <venture@google.com>, linux-hwmon@vger.kernel.org,
        Emily Shaffer <emilyshaffer@google.com>,
        Peter Hanson <peterh@google.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Jun 26, 2017 at 11:09 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On 06/26/2017 06:08 AM, Joel Stanley wrote:
>>
>> On Sat, Jun 24, 2017 at 11:23 PM, Guenter Roeck <linux@roeck-us.net>
>> wrote:
>>>
>>> On 06/23/2017 08:39 PM, Patrick Venture wrote:
>>
>>
>>>>
>>>> Reduce the fan_tach period such that the fan controller uses a shorter
>>>> period to measure the rpm.
>>>>
>>>
>>> This explains what you are doing, but not why. What is the problem you
>>> are
>>> trying to solve, and why doesn't it create other problems ? Presumably
>>> there
>>> was a reason for the larger period used earlier. If not, if it was just a
>>> conservative setting, here is the place to say it.
>>>
>>> I'd update the information myself, but I don't think the underlying
>>> specification
>>> is public, or at least I did not find it.
>>
>>
>> The datasheet for the Aspeed SoC is not public. Patrick and I can help
>> answer questions, and I've added Ryan from Aspeed who can answer
>> questions in more detail.
>>
>> As I understand it this setting is a trade off between giving the tach
>> unit enough time to measure complete fan rotations under all
>> conditions (ie, when the fans are going slow) and getting a timely
>> measurement. With the driver as-is we have a large delay between
>> readings, which makes writing a control loop impossible.
>>
>> I'm not convinced that this driver had enough testing before it was
>> merged. I agree that Patrick should provide reasoning for his changes,
>
>
> The driver or the latest set of patches ?
>
> Everyone is encouraged to review patches. If there are concerns with a
> driver,
> those should be raised during the review process. I am not really the
> fastest
> reacting maintainer nowadays, so I would think there should have been enough
> time for such feedback. In case concerns were raised and I missed it, my
> apologies.

The driver. I was too slow to voice my objections, so you were fine on
your part.

Cheers,

Joel
