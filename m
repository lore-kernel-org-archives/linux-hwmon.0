Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:52139 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751888AbcIIETa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Sep 2016 00:19:30 -0400
Subject: Re: [PATCH v5] hwmon: (max6650.c) Add devicetree support
To: Mike Looijmans <mike.looijmans@topic.nl>,
        linux-hwmon@vger.kernel.org
References: <1471848471-13144-1-git-send-email-mike.looijmans@topic.nl>
Cc: linux-kernel@vger.kernel.org, hjk@hansjkoch.de
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <17b23aae-371f-4ad1-74ba-94717f87a9fb@roeck-us.net>
Date: Thu, 8 Sep 2016 21:19:28 -0700
MIME-Version: 1.0
In-Reply-To: <1471848471-13144-1-git-send-email-mike.looijmans@topic.nl>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/21/2016 11:47 PM, Mike Looijmans wrote:
> Parse devicetree parameters for voltage and prescaler setting. This allows
> using multiple max6550 devices with varying settings, and also makes it
> possible to instantiate and configure the device using devicetree.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>


Applied to hwmon-next.

Thanks,
Guenter


