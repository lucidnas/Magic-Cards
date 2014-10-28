//
//  MagicCardsViewController.m
//  Magic Cards
//
//  Created by nasbone on 9/25/14.
//  Copyright (c) 2014 CMP464. All rights reserved.
//

//
//  CardGameViewController.m
//  homework1
//
//  Created by Abdulnasir Mohammed on 9/11/14.
//  Copyright (c) 2014 CMP464. All rights reserved.
//

#import "MagicCardsViewController.h"
#import "HistoryViewController.h"



@interface MagicCardsViewController ()

//connects label to code using a weak pointer

//@property (nonatomic) int flipCount;
//@property (strong, nonatomic) PlayingCardDeck *playingCardDeck;
@property (strong, nonatomic) Deck *deck;

//@property (nonatomic, strong) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UITextView *displayGameProcess;


@property (weak, nonatomic) IBOutlet UISwitch *MagicCardSwitch;
@property (weak, readwrite) IBOutlet UITextField *statusField;

@property (nonatomic)  NSAttributedString *symbol;

@end

@implementation MagicCardsViewController




//lazy instanciation of the Cardmatching game object
-(CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}

//Abstract method
-(Deck *)createDeck
{
    return nil;
}


//touch button that accepts user input
- (IBAction)touchButton:(UIButton *)sender {
    
    NSInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    self.statusField.text = self.game.status;
    
    
//    NSMutableAttributedString *saved = [[NSMutableAttributedString alloc]initWithString:@"Matching:"];
//    
//    [saved appendAttributedString:sender.currentAttributedTitle];
    self.statusLabel.Text = self.game.status;
    
//    [[NSMutableAttributedString alloc]initWithAttributedString:sender.currentAttributedTitle];

    self.buttonAttribute = sender.currentAttributedTitle;
    
    [self updateUI];
    
}

//deal button that resets deck on click and updates ui
- (IBAction)dealButton:(UIButton *)sender {
    
    self.game = nil;
    //self.game.switchMatch = self.game.switchMatch;
    self.statusField.attributedText = [[NSAttributedString alloc]initWithString:@"Message Board"];
    self.statusLabel.attributedText = [[NSAttributedString alloc]initWithString:@"Message Board"];
    //self.MagicCardSwitch.enabled = YES;
    //[self.MagicCardSwitch setOn:NO];
	[self updateUI];
}

//switch button that switches to 3 or 2 card matching modes depending on user input. it also displays mode in user message board
- (IBAction)magicCardSwitch:(UISwitch *)sender {
    int numOfCards = 1;
    if (sender.isOn) {
        _game.switchMatch = 2;
        numOfCards = 3;
    } else {
        _game.switchMatch = 1;
        numOfCards = 2;
    }
    self.statusField.text = [NSString stringWithFormat:@"%d Card Match Mode", numOfCards];
    
}


-(NSAttributedString *)symbol{
    if (!_symbol) _symbol = [[NSAttributedString alloc]initWithString:@""];
    
    return _symbol;
}


//this sets the button background and title based on the index of the button
-(void)updateUI
{
    for (UIButton *cardButton in self.cardButtons)
    {
        NSInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        self.card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setBackgroundImage:[self backgroundImageForCard:self.card] forState:UIControlStateNormal];
        
        
        [cardButton setAttributedTitle:[self titleForCard:self.card] forState:UIControlStateNormal];
        
        //a card is enabled only if it is NOT matched
        cardButton.enabled = !self.card.isMatched;
       
       // self.statusField.attributedText = cardButton.currentAttributedTitle;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
       // NSLog(@"haha %@", cardButton.currentTitle);
        

    }
}

    


//checks to see if card is open and returns contents
//-(NString *)titleForCard:(Card *)card
//{
//    return card.isChosen ? card.contents : @"";
//}
- (NSAttributedString *)titleForCard:(Card *)card
{
    NSAttributedString *title = [[NSAttributedString alloc]
                                 initWithString:card.chosen ? card.contents : @""];
    return title;
}


// returns background if card is unchosen and returns front of card if chosen
- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}



@end
