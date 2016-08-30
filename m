Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from smtp05.mail.online.nl ([194.134.25.75]:44926 "EHLO
        smtp05.mail.online.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756292AbcH3REt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 Aug 2016 13:04:49 -0400
Subject: Re: [PATCH 2/2] hwmon: (max6650) Add initial rpm target devicetree
 documentation
To: Rob Herring <robh@kernel.org>
References: <1472026407-3448-1-git-send-email-mike.looijmans@topic.nl>
 <1472026407-3448-2-git-send-email-mike.looijmans@topic.nl>
 <20160830163804.GA5954@rob-hp-laptop>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux@roeck-us.net, linux-kernel@vger.kernel.org
From: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <57C5BAAC.1090002@topic.nl>
Date: Tue, 30 Aug 2016 18:56:12 +0200
MIME-Version: 1.0
In-Reply-To: <20160830163804.GA5954@rob-hp-laptop>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 30-08-16 18:38, Rob Herring wrote:
> On Wed, Aug 24, 2016 at 10:13:27AM +0200, Mike Looijmans wrote:
>> Add devicetree property for early initialization of the fan controller
>> to prevent overheating, for example when resetting the board while the
>> fan was completely turned off.
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>>   Documentation/devicetree/bindings/hwmon/max6650.txt | 5 +++++
>>   1 file changed, 5 insertions(+)
>
> The kernel boot seems kind of late to ensure your fan is running, but
>
> Acked-by: Rob Herring <robh@kernel.org>

Thanks!

Well, "late's better than never," my grandma used to say when we visited :)

To put your mind at ease, the particular platform I'm using this for is 
an xc7z045 (Zynq) where the ARMs running the Linux kernel will only 
account for 0.5W, but once the logic awakens the chip can dissipate up 
to 30W. The logic bitstream is usually on the rootfs, so kernel boot is 
early enough for the fan to start spinning. And with the logic asleep, 
it need not spin at all.


-- 
Mike Looijmans
