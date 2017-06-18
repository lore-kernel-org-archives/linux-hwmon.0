Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36472 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750970AbdFRUAR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 18 Jun 2017 16:00:17 -0400
Subject: Re: Question about nct6775 and w83627ehf
To: Philip Prindeville <philipp_subx@redfish-solutions.com>
Cc: linux-hwmon@vger.kernel.org
References: <48F7D8C9-21F9-4439-9069-34C05FBCF6A7@redfish-solutions.com>
 <0d70a41e-1b14-1f30-067e-c7d6085179ac@roeck-us.net>
 <119B8D97-1DE5-4868-AF3D-3FF0C9646F68@redfish-solutions.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <40c612b4-6229-9e90-a89f-9209ef09f2db@roeck-us.net>
Date: Sun, 18 Jun 2017 13:00:15 -0700
MIME-Version: 1.0
In-Reply-To: <119B8D97-1DE5-4868-AF3D-3FF0C9646F68@redfish-solutions.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/18/2017 12:51 PM, Philip Prindeville wrote:
> 
>> On Jun 15, 2017, at 6:35 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 06/15/2017 03:34 PM, Philip Prindeville wrote:
>>> Hi.
>>> I’m working on a platform that uses the nct6775, and if I load a generic “everything and the kitchen since” kernel on it, then the w83627ehf module ends up claiming the nct6775 chipset.
>>> My understanding was that the nct6775 driver supplants the w83627ehf for supporting the nct6775/6.
>>> But if that’s the case, shouldn’t ec3e5a16446fef1891611fe3bdfa5954d1ddf5e4 have been partially backed out?
>>> Well, there would have been a few others, too, I guess:
>>> d42e869acf0da4502c452b786dee35f0ecf4cbc8
>>> ad77c3e1808f07fa70f707b1c92a683b7c7d3f85
>>> 585c0fd8216e0c9f98e2434092af7ec0f999522d
>>> 33fa9b620409edfc71aa6cf01a51f990fbe46ab8
>>> What’s the chance of the nct6775 stuff all getting scrubbed out?
>>
>> Yes, we had a patch in the works to do that but right now it is stalled.
>> Feel free to submit a patch yourself to do it.
>>
>> Normally though those drivers are built as modules and loaded explicitly
>> from /etc/modules or a similar configuration file. In other words, it is
>> the user's choice. Building a Super-IO chip driver into the kernel is in
>> general a bad idea since they all try to instantiate themselves. Worst
>> case that may result in misdetection and even crashes.
>>
>> Guenter
> 
> 
> Well, I was going through the first commit, ec3e5a16446fef1891611fe3bdfa5954d1ddf5e4, and it occurred to me that I couldn’t tell if ALL of the commit was necessary and relevant exclusively to the nct6775/6 functionality (and therefore could all be backed out), or if some of it was generalized cleanup and/or improvement which was prompted (or required) by the new functionality but could also stand alone on its own merit.
> 
> That is, does ALL of this commit need to be backed out, or does it contain improvements which (might have been a separate, isolated commit) can be left behind because they improve overall code quality and/or functionality?
> 

We need to take out anything that refers to nct6775/nct6776. That does not mean a simple revert,
but editing the code.

Guenter
