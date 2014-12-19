//
//  BitVector.m
//  test1111
//
//  Created by kekey on 14/12/19.
//  Copyright (c) 2014年 zhang. All rights reserved.
//

#import "BitVector.h"

#define kShift      (5)//2^5=32
#define kMask       0x1F // vaule 11111 in binary

@interface BitVector()
{
    int *bitVector;
}
@property(nonatomic,readwrite)NSUInteger length;
@end

@implementation BitVector

- (instancetype)init
{
    return [self initWithVectorLenght:0];
}

- (instancetype)initWithVectorLenght:(NSUInteger)length
{
    self = [super init];
    if ( self ) {
        self.length = length;
        size_t blockLen = length/sizeof(int) + 1;
        bitVector = (int*)malloc(sizeof(int)*blockLen);
        memset(bitVector, 0, sizeof(int)*blockLen);
    }
    return self;
}

- (void)dealloc
{
    if ( bitVector ) {
        free(bitVector);
    }
#if !__has_feature(objc_arc)
    [super dealloc];
#endif
}

- (void)setBitAtIndex:(NSUInteger)index
{
    NSAssert(index<_length, @"长度越界");
    //index>>kShift,第几个int值,相当于index/32
    //index&kMask,在int中的第几位,相当于index - index/32
    bitVector[index>>kShift] |= (1<<(index&kMask));
}

- (void)clearBitAtIndex:(NSUInteger)index
{
    NSAssert(index<_length, @"长度越界");
    bitVector[index>>kShift] &= ~(1<<(index&kMask));
}

- (int)getBitAtIndex:(NSUInteger)index
{
    NSAssert(index<_length, @"长度越界");
    if ( bitVector[index>>kShift] & (1<<(index&kMask)) ) {
        return 1;
    }
    return 0;
}

- (void)toggleBitAtIndex:(NSUInteger)index
{
    NSAssert(index<_length, @"长度越界");
    bitVector[index>>kShift] ^= (1<<(index&kMask));
}

@end
